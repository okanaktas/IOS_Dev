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
    var randomNumber : Int = 0
    
    var highScore = 0
    
    var imageViewArray : [UIImageView] = []
    
    var countDownTimer = Timer()
    var showRandomImages = Timer()
    
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
        
        highScore = UserDefaults.standard.integer(forKey: "highScore")
        
        imageViewArray = [imageView0, imageView1, imageView2, imageView3, imageView4, imageView5, imageView6, imageView7, imageView8]
        
        counterLabel.text = "Counter: \(counter)"
        
        
        countDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        showRandomImages = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
        
        for i in imageViewArray {
            i.isUserInteractionEnabled = true
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
            i.addGestureRecognizer(recognizer)
            
            i.isHidden = true
            
        }
        
        
    }
    
    @objc func countDown(){
        counter -= 1
        counterLabel.text = "Counter: \(counter)"
        
        if counter <= 0 {
            countDownTimer.invalidate()
            showRandomImages.invalidate()
            
            let alert = UIAlertController(title: "Time's up!", message: "Do you wanna play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel,handler: nil)
            let replayButton = UIAlertAction(title: "Replay ?", style: UIAlertAction.Style.default) { UIAlertAction in
                
                self.counter = 30
                self.score = 0
                
                self.counterLabel.text = "Counter: \(self.counter)"
                self.scoreLabel.text = "Score: \(self.score)"
                
                self.countDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.showRandomImages = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.showRandomImage), userInfo: nil, repeats: true)
                
                
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            
            for i in imageViewArray{
                i.isHidden = true
            }
            if score > highScore{
                highScore = score
                UserDefaults.standard.set(highScore, forKey: "highScore")
            }
        }
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func showRandomImage(){
        for i in imageViewArray{
            i.isHidden = true
        }
        
        randomNumber = Int(arc4random_uniform(UInt32(imageViewArray.count)))
        imageViewArray[randomNumber].isHidden = false
        
    }
    
}
