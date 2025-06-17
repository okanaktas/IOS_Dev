//
//  DetailsViewController.swift
//  IBAN Storage
//
//  Created by Okan Aktas on 17.06.2025.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bankName: UITextField!
    @IBOutlet weak var ibanNo: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let gestureKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureKeyboard)
        let gestureImage = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        view.addGestureRecognizer(gestureImage)
        
        
        
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    
    @objc func tapImage(){
        
    }
    
}
