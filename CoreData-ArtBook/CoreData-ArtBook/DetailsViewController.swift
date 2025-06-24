//
//  DetailsViewController.swift
//  CoreData-ArtBook
//
//  Created by Bugra Okan Aktas on 23.06.2025.
//

import UIKit
import CoreData

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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let newPainting  = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        //Attributes
        newPainting.setValue(nameText.text, forKey: "nameText")
        newPainting.setValue(artistText.text, forKey: "artistText")
        
        if let year = Int(yearText.text!){
            newPainting.setValue(year, forKey: "yearText")
        }
        
        newPainting.setValue(UUID(), forKey: "id")
        //görseli dataya çevirip, görseli sıkıştırma oranı
        let data = imageView.image?.jpegData(compressionQuality: 0.8)!
        newPainting.setValue(data, forKey: "imageView")
        
        do{
            try context.save()
            print("Success")
        }catch{
            print("Error!")
        }
        
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
