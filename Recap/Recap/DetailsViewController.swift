//
//  DetailsViewController.swift
//  Recap
//
//  Created by Okan Aktas on 11.06.2025.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var image : UIImage?
    var name : String?
    var birthday : String?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        nameLabel.text = name
        birthdayLabel.text = birthday
        
    }

}
