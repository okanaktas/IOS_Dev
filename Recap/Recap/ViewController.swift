//
//  ViewController.swift
//  Recap
//
//  Created by Okan Aktas on 10.06.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UITextField!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.object(forKey: <#T##String#>)
        
    }

    @IBAction func buttonPlay(_ sender: Any) {
        performSegue(withIdentifier: "toGameVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameVC" {
            let destinationVC = segue.destination as! GameViewController
            destinationVC.counter = Int(counterLabel.text ?? "20") ?? 20
        }
    }
    
}

