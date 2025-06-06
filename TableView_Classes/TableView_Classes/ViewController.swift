//
//  ViewController.swift
//  TableView_Classes
//
//  Created by Okan Aktas on 6.06.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var personList : [Person] = []
    
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
        personList.count - 1
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
    
    
}

