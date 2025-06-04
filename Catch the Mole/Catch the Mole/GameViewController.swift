//
//  GameViewController.swift
//  Catch the Mole
//
//  Created by Okan Aktas on 4.06.2025.
//

import UIKit

class GameViewController: UIViewController {
    
    var counter : Int = 30
    
    var countDownTimer = Timer()

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var imageView0: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        counterLabel.text = "Counter: \(counter)"
        
        countDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        
        
    }
    
    @objc func countDown(){
        counter -= 1
        counterLabel.text = "Counter: \(counter)"
    }

}
