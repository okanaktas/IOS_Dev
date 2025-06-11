//
//  DetailsViewController.swift
//  ArtBook
//
//  Created by Okan Aktas on 11.06.2025.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(recognizer)
        
    }

    @IBAction func saveButton(_ sender: Any) {
        
        
    }
    
    @objc func hideKeyboard(){
        //o view içerisinde yapılan değişiklikleri bitiriyor
        view.endEditing(true)
    }
    
    
    
}
