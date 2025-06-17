//
//  ViewController.swift
//  IBAN Storage
//
//  Created by Okan Aktas on 17.06.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    var 
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }


}

