//
//  GameViewController.swift
//  Catch The Moles
//
//  Created by Bugra Okan Aktas on 20.06.2025.
//

import UIKit

class GameViewController: UIViewController {
    
    var counter = 30
    var score = 0
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
        
        for i in molesArray{
            i.isUserInteractionEnabled = true
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(moleTapped))
            i.addGestureRecognizer(recognizer)
            i.isHidden = true
        }
        
        
        
    }
    
    @objc func counterFunc(){
        counter -= 1
        counterLabel.text = "Counter: \(counter)"
        
        if counter == 0{
            timerForCounter.invalidate()
            timerForMoles.invalidate()
        }
    }
    
    @objc func showMolesFunc(){
        for i in molesArray{
            i.isHidden = true
        }
        var randomNumber = Int(arc4random_uniform(UInt32(molesArray.count)))
        molesArray[randomNumber].isHidden = false
     
    }
    
    @objc func moleTapped(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }

}
