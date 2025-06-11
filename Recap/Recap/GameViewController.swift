//
//  GameViewController.swift
//  Recap
//
//  Created by Okan Aktas on 10.06.2025.
//

import UIKit

class GameViewController: UIViewController {
    
    var counter = 30
    var score = 0
    var highScore = 0
    
    var counterTimer = Timer()
    var showImages = Timer()
    
    var imagesArray : [UIImageView] = []
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var imageView0: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagesArray = [imageView0, imageView1, imageView2, imageView3, imageView4, imageView5]
        
        counterLabel.text = "Counter: \(counter)"
        
        counterTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counterTimerFunc), userInfo: nil, repeats: true)
        showImages = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showImage), userInfo: nil, repeats: true)
        
        for i in imagesArray{
            i.isHidden = true
            i.isUserInteractionEnabled = true
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
            i.addGestureRecognizer(recognizer)
        }
        
    }
    
    @objc func counterTimerFunc () {
        counter -= 1
        counterLabel.text = "Counter: \(counter)"
        
        if counter <= 0 {
            counterTimer.invalidate()
            showImages.invalidate()
            
            for i in imagesArray{
                i.isHidden = true
            }
            
            let alert = UIAlertController(title: "Time's up", message: "Do you wanna again ?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay Game ?", style: UIAlertAction.Style.default) { UIAlertAction in
                self.score = 0
                self.counter = 30
                
                self.scoreLabel.text = "Score: \(self.score)"
                self.counterLabel.text = "Counter: \(self.counter)"
                
                
                self.counterTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.counterTimerFunc), userInfo: nil, repeats: true)
                self.showImages = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.showImage), userInfo: nil, repeats: true)
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true)
            
            //Bu alanda süre bittikten sonra score'u ViewController'a göndermek istiyorum fakat daha önce bir highScore var ise ViewController'da karşıaştırsın ve yüksek olanı kaydetsin
            UserDefaults.standard.set(self.score, forKey: "highScore")
        }
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func showImage(){
        for i in imagesArray{
            i.isHidden = true
        }
        let randomNumber = Int(arc4random_uniform(UInt32(imagesArray.count)))
        imagesArray[randomNumber].isHidden = false
    }
}
