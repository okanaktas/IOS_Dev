//
//  ViewController.swift
//  TableView_Classes
//
//  Created by Okan Aktas on 6.06.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var personList : [Person] = []
    
    var choosenName = ""
    var choosenJob = ""
    var choosenAge = 0
    var choosenImage = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let okan = Person(name: "Okan", job: "Engineer", age: 28, image: UIImage(systemName: "car")!)
        let berkay = Person(name: "Berkay", job: "student", age: 12, image: UIImage(systemName: "person")!)
        let ahmet = Person(name: "Ahmet", job: "lawyer", age: 26, image: UIImage(systemName: "car.fill")!)
        
        personList = [okan,berkay,ahmet]
                            
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tableView içerisinde ki hücre dışındaki çerçeve
        let cell = UITableViewCell()
        //hücreler
        var content = cell.defaultContentConfiguration()
        content.image = personList[indexPath.row].image
        content.text = personList[indexPath.row].name
        content.secondaryText = personList[indexPath.row].job
        //yeni oluşturduğumuz contenti cell'e eşitliyorum
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //segue yapmadan önce hangisi seçildiyse o değerleri aktarma yapıyorum
        choosenName = personList[indexPath.row].name!
        choosenJob = personList[indexPath.row].job!
        choosenAge = personList[indexPath.row].age!
        choosenImage = personList[indexPath.row].image!
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsViewController
            
            //Burada seçilen değeri göndereceğiz fakat seçilen değeri bilmiyoruz. Bunu da perform içerisinde yapacağız çünkü indexPath olarak hangisinin seçildiği bilgisi bana veriliyor. En yukarıda choosenName... olarak hepsini tanımladım ki her yerden ulaşabileyim diye
            destinationVC.selectedName = choosenName
            destinationVC.selectedJob = choosenJob
            destinationVC.selectedAge = choosenAge
            destinationVC.selectedImage = choosenImage
        }
    }
    
    
}

