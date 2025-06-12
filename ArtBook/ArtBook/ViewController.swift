//
//  ViewController.swift
//  ArtBook
//
//  Created by Okan Aktas on 11.06.2025.
//

import UIKit
import CoreData

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    //CoreData'dan çekeceğim şeyler için
    var nameArray : [String] = []
    var idArray : [UUID] = []
    
    var savedName = ""
    var savedUUID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addImageButton))
        
        getData()
    }
    
    //viewDidLoad sadece app ilk kez açıldığında çalışıyordu fakat biz NotificationCenter diye Details içerisinden mesaj gönderdik ve onu almamız gerek değişiklik olduğu için bu yüzden bunu viewWillAppear içerisinde yapacğaız çünkü viewWillAppear her Bu VC açıldığında çalışıyor.
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name("reloadData"), object: nil)
    }
    
    @objc func getData(){
        
        //CoreData'da bir kere gözükmesine rağmen NotificationCenter yüzünden dizi içerisine iki kere veri çekmiş oluyorum ve tableView'da datalar iki kere gözüküyor bu yüzden
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context =  appDelegate.persistentContainer.viewContext
        
        //fetch -> tut getir demek. Sonuçlarını alacağım bir istek yapıyorum
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        /*
         Ne işe yarar?
         Core Data varsayılan olarak, veri çekildiğinde "fault" adı verilen yer tutucular döner. Yani nesneler belleğe tam olarak yüklenmez, sadece ihtiyaç duyulduğunda (örneğin bir özelliğine erişildiğinde) yüklenir. Bu bellekten tasarruf sağlar.
         
         returnsObjectsAsFaults = false dersen:
         
         👉 Core Data, çektiğin tüm nesneleri tamamen belleğe yükler (eager loading).
         👉 Yani, sonuçlar yer tutucu (fault) olarak değil, tam nesne olarak döner.
         
         ✅ Ne zaman kullanılır?
         Bu ayarı kullanmak isteyebileceğin bazı durumlar:
         
         Tüm verileri hemen kullanacaksan, her defasında fault çözülmesini istemiyorsan.
         Performans için verilerin toplu işlenmesi gerekiyorsa.
         UI'da tüm özelliklere hemen erişmen gerekiyorsa.
         ⚠️ Dikkat edilmesi gerekenler:
         Belleğe çok sayıda nesne yüklenirse bellek kullanımı artar.
         Büyük veri setlerinde bu ayar performansı olumsuz etkileyebilir.
         */
        fetchRequest.returnsObjectsAsFaults = false
        //Burada değerler gelecek ama bu gelen değerler bir dizi içerisinde gelecek bu yüzden results diye bir değişkene atadım ve dönen any tipindeki diziyi tek tek inceleyeceğim.
        do{
            let results = try context.fetch(fetchRequest)
            //Burada NSManagedObject'e casting yapıyoruz ki çekilen değerleri tek tek ele alabileyim. NSManagedObject: Core Data’daki kayıtları temsil eder.
            if results.count > 0{
                for result in results as! [NSManagedObject] {
                    if let name = result.value(forKey: "name") as? String{
                        self.nameArray.append(name)
                    }
                    if let id = result.value(forKey: "id") as? UUID{
                        self.idArray.append(id)
                    }
                    
                    //Burada data geldiği için tableView'ı reload yapmam gerek
                    self.tableView.reloadData()
                }
            }
        }catch{
            print("Error")
        }
    }
    
    @objc func addImageButton() {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var context = cell.defaultContentConfiguration( )
        context.text = nameArray[indexPath.row]
        cell.contentConfiguration = context
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        savedName = nameArray[indexPath.row]
        savedUUID = idArray[indexPath.row]
        performSegue(withIdentifier: "toSavedVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSavedVC" {
            let destinationVC = segue.destination as! SavedViewController
            destinationVC.savedName = savedName
            destinationVC.savedUUID = savedUUID
        }
    }
    
    //editingStyle kullanıcı delete mi ne yapıyor onu algılayıp gerekli işlemi yapıyoruz.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            let appDelegete = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegete.persistentContainer.viewContext
            
            //veriyi silmek için önce çekip sonra siliyoruz
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            let idString = idArray[indexPath.row].uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id == %@", idString)
            
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(fetchRequest)
                if results.count > 0{
                    for result in results as! [NSManagedObject]{
                        if let id = result.value(forKey: "id") as? UUID{
                            if id == idArray[indexPath.row]{
                                //coreData dan siliyoruz
                                context.delete(result)
                                nameArray.remove(at: indexPath.row)
                                idArray.remove(at: indexPath.row)
                                self.tableView.reloadData()
                                
                                do{
                                    try context.save()
                                }catch{
                                    print("error")
                                }
                                //Aradığım şeyi bulup sildiysem halen dizinin tamamına bakmasına gerek yok. Break diyorum ve çıkıyorum. id üzerinden arama yapıyorum sorun olmaz ama id kullanamadığımız bir durum olursa name vs gibi o zaman break çok işe yarar
                                break
                            }
                        }
                    }
                }
            }catch{
                print("error")
            }
        }
    }
    
    
}

