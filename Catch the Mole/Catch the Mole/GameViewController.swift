//
//  GameViewController.swift
//  Catch the Mole
//
//  Created by Okan Aktas on 4.06.2025.
//

import UIKit

class GameViewController: UIViewController {
    
    var counter : Int = 30
    var score : Int = 0
    
    var imageViewArray : [UIImageView] = []
    
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
        
        imageViewArray = [imageView0, imageView1, imageView2, imageView3, imageView4, imageView5, imageView6, imageView7, imageView8]
        
        counterLabel.text = "Counter: \(counter)"
        
        countDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        for i in imageViewArray {
            i.isUserInteractionEnabled = true
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
            i.addGestureRecognizer(recognizer)
        }
        
        
        
    }
    
    @objc func countDown(){
        counter -= 1
        counterLabel.text = "Counter: \(counter)"
        
        if counter <= 0 {
            countDownTimer.invalidate()
        }
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }

}
