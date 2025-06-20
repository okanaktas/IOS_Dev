//
//  ViewController.swift
//  Catch The Moles
//
//  Created by Bugra Okan Aktas on 20.06.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


    @IBAction func startGameButton(_ sender: Any) {
        performSegue(withIdentifier: "toGameVC", sender: nil)
        
    }
}

