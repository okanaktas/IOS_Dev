//
//  ViewController.swift
//  Catch the Mole
//
//  Created by Okan Aktas on 4.06.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func playButton(_ sender: Any) {
        performSegue(withIdentifier: "toGameVC", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameVC" {
            let destinationVC = segue.destination as! GameViewController
            destinationVC.counter = Int(counterLabel.text ?? "30") ?? 30
        }
    }
    
}

