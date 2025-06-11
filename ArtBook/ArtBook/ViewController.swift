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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addImageButton))
        
        getData()
    }
    
    func getData(){
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
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }


}

