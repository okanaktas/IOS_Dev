//
//  DetailsViewController.swift
//  IBAN Storage
//
//  Created by Okan Aktas on 17.06.2025.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newValues = NSEntityDescription.insertNewObject(forEntityName: "Values", into: context)
        
        newValues.setValue(bankName.text, forKey: "bank")
        
        if let iban = Int(ibanNo.text!){
            newValues.setValue(iban, forKey: "iban")
        }
        
        newValues.setValue(UUID(), forKey: "id")
        
        let imageView = imageView.image?.jpegData(compressionQuality: 0.5)
        
        newValues.setValue(imageView, forKey: "image")
        
        do{
            try context.save()
            print("Success")
        }catch{
            print("Error")
        }
        
        
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    
    @objc func tapImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true)
    }
}
