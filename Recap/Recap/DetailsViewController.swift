//
//  DetailsViewController.swift
//  Recap
//
//  Created by Okan Aktas on 11.06.2025.
//

import UIKit

class DetailsViewController: UIViewController , UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Recognizers
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(recognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(importImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
        
        
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    
    
    @IBAction func saveButton(_ sender: Any) {
    }
    
    @objc func importImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        dismiss(animated: true)
    }
}
