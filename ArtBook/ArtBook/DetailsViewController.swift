//
//  DetailsViewController.swift
//  ArtBook
//
//  Created by Okan Aktas on 11.06.2025.
//

import UIKit

class DetailsViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Recognizers
        //For hidden keyboard
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(recognizer)
        //For selectImage
        imageView.isUserInteractionEnabled = true
        let imageRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageRecognizer)
        
    }

    @IBAction func saveButton(_ sender: Any) {
        
        
    }
    
    @objc func hideKeyboard(){
        //o view içerisinde yapılan değişiklikleri bitiriyor
        view.endEditing(true)
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
    }
    
    
    
}
