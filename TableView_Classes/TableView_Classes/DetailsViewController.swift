//
//  DetailsViewController.swift
//  TableView_Classes
//
//  Created by Okan Aktas on 6.06.2025.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var selectedName = "Name: "
    var selectedJob = "Job: "
    var selectedAge = 0
    var selectedImage = UIImage()

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "Name: \(selectedName)"
        jobLabel.text = "Job: \(selectedJob)"
        ageLabel.text = "Age: \(selectedAge)"
        
        imageView.image = selectedImage
        
        
        
        
    }

}
