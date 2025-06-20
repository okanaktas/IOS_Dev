//
//  ViewController.swift
//  Catch The Moles
//
//  Created by Bugra Okan Aktas on 20.06.2025.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var lastScore = 0
    var lastScoreList : [Int] = []
    
    var dataArray : [Int] = []
    var idArray : [UUID] = []
    

    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        lastScoreList = [lastScore]
        
        getData()
    
    }
    
    func getData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LastScore")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject]{
                if let lastScore = result.value(forKey: "score") as? Int{
                    dataArray.append(lastScore)
                }
                if let id = result.value(forKey: "id") as? UUID{
                    idArray.append(id)
                }
                self.tableView.reloadData()
            }
        }catch {
            print("Error fetching data")
        }
    }


    @IBAction func startGameButton(_ sender: Any) {
        performSegue(withIdentifier: "toGameVC", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var context = cell.defaultContentConfiguration()
        context.image = UIImage(systemName: "person.circle")
        context.text = "Player: \(dataArray[indexPath.row])"
        cell.contentConfiguration = context
        return cell
    }
}

