//
//  ViewController.swift
//  Recap
//
//  Created by Okan Aktas on 11.06.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var personArray : [Person] = []
   
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        let okan = Person(image: UIImage(systemName: "person.circle")!, name: "Okan", birthday: 96)
        let berkay = Person(image: UIImage(systemName: "car.fill")!, name: "Berkay", birthday: 13)
        
        personArray = [okan, berkay]
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration( )
        content.image = personArray[indexPath.row].image
        content.text = personArray[indexPath.row].name
        content.secondaryText = "\(personArray[indexPath.row].birthday)"
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.image = personArray[tableView.indexPathForSelectedRow!.row].image
            destinationVC.name = personArray[tableView.indexPathForSelectedRow!.row].name
            destinationVC.birthday = "\(personArray[tableView.indexPathForSelectedRow!.row].birthday)"
        }
    }

}


