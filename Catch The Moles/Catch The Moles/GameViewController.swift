//
//  GameViewController.swift
//  Catch The Moles
//
//  Created by Bugra Okan Aktas on 20.06.2025.
//

import UIKit
import CoreData

class GameViewController: UIViewController {
    
    var counter = 30
    var score = 0
    var lastScore = 0
    
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
            
            //database
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let data = NSEntityDescription.insertNewObject(forEntityName: "LastScore", into: context)
            
            //attributes
            data.setValue(score, forKey: "score")
            data.setValue(UUID(), forKey: "id")
            
            do{
                try context.save()
                print("Success")
            }catch{
                print("Error")
            }
            
            NotificationCenter.default.post(name: NSNotification.Name("updateHighScore"), object: nil)
            
            
            let alert = UIAlertController(title: "Do You Wanna Play Again?", message: "Your score is \(score)", preferredStyle: .alert)
            let noButton = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel) { UIAlertAction in
                self.navigationController?.popViewController(animated: true)
            }
            let replayButton = UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default) { UIAlertAction in
                self.counter = 30
                self.score = 0
                
                self.counterLabel.text = "Counter: \(self.counter)"
                self.scoreLabel.text = "Score: \(self.score)"
                
                self.timerForCounter = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.counterFunc), userInfo: nil, repeats: true)
                self.timerForMoles = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.showMolesFunc), userInfo: nil, repeats: true)
                
                
            }
            alert.addAction(noButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true)
            
        }
    }
    
    @objc func showMolesFunc(){
        for i in molesArray{
            i.isHidden = true
        }
        let randomNumber = Int(arc4random_uniform(UInt32(molesArray.count)))
        molesArray[randomNumber].isHidden = false
        
    }
    
    @objc func moleTapped(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
}
