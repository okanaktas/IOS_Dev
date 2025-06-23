//
//  DetailsViewController.swift
//  CoreData-ArtBook
//
//  Created by Bugra Okan Aktas on 23.06.2025.
//

import UIKit

class DetailsViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Recognizer
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
        
        
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        //Kullanıcı seçtiği görseli editleyebilmesi için
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    //Medya seçildikten sonra ne olacağı, seçilen görsel any dönüyor
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        //açtığım picker'ı kapatmak için
        self.dismiss(animated: true)
    }
    
    
    
}
