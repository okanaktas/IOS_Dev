//
//  ViewController.swift
//  CoreData-ArtBook
//
//  Created by Bugra Okan Aktas on 23.06.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addView))
    }

    @objc func addView(){
        performSegue(withIdentifier: "toDetailsVC", sender: self)
    }

}

