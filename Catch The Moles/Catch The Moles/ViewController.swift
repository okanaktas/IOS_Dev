//
//  ViewController.swift
//  Catch The Moles
//
//  Created by Bugra Okan Aktas on 20.06.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var highScore = 0
    var highScoreList : [Int] = []
    

    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        highScoreList = [highScore]
        
    }


    @IBAction func startGameButton(_ sender: Any) {
        performSegue(withIdentifier: "toGameVC", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        highScoreList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var context = cell.defaultContentConfiguration()
        context.image = UIImage(systemName: "person.circle")
        context.text = "Player: \(highScore)"
        cell.contentConfiguration = context
        return cell
    }
}

