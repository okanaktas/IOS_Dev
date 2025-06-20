//
//  GameViewController.swift
//  Catch The Moles
//
//  Created by Bugra Okan Aktas on 20.06.2025.
//

import UIKit

class GameViewController: UIViewController {
    
    var counter = 30
    var timerForCounter = Timer()
    var timerForMoles = Timer()
    
    var molesArray : [UIImageView] = []

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var imageViewMole0: UIImageView!
    @IBOutlet weak var imageViewMole1: UIImageView!
    @IBOutlet weak var imageViewMole2: UIImageView!
    @IBOutlet weak var imageViewMole3: UIImageView!
    @IBOutlet weak var imageViewMole4: UIImageView!
    @IBOutlet weak var imageViewMole5: UIImageView!
    @IBOutlet weak var imageViewMole6: UIImageView!
    @IBOutlet weak var imageViewMole7: UIImageView!
    @IBOutlet weak var imageViewMole8: UIImageView!
    @IBOutlet weak var imageViewMole9: UIImageView!
    @IBOutlet weak var imageViewMole10: UIImageView!
    @IBOutlet weak var imageViewMole11: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        molesArray = [imageViewMole0, imageViewMole1, imageViewMole2, imageViewMole3, imageViewMole4, imageViewMole5, imageViewMole6, imageViewMole7, imageViewMole8, imageViewMole9, imageViewMole10, imageViewMole11]
        
        timerForCounter = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counterFunc), userInfo: nil, repeats: true)
        timerForMoles = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showMolesFunc), userInfo: nil, repeats: true)
        
        
        
        
        
    }
    
    @objc func counterFunc(){
        counter -= 1
        counterLabel.text = "Counter: \(counter)"
        
        if counter == 0{
            timerForCounter.invalidate()
        }
    }
    
    @objc func showMolesFunc(){
        
    }

}
