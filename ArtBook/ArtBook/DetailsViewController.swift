//
//  DetailsViewController.swift
//  ArtBook
//
//  Created by Okan Aktas on 11.06.2025.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{

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
        
        //Aynı userdefault gibi UIApplication.shared diyince tüm dosyalardan erişebiliyorum.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //context içeisine ne koyacağımı yazıyorum
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        //
    }
    
    @objc func hideKeyboard(){
        //o view içerisinde yapılan değişiklikleri bitiriyor
        view.endEditing(true)
    }
    
    @objc func selectImage(){
        //Fotoğraflara erişebilmek için picker tanımlıyoruz
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        //Kullanıcın seçtiği görsele edit yapabilmesi için
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    //Kullanıcı görseli seçtikten sonra ne olacağını yazmak için didFinishPicker yazıyorum
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //bana any döndürüyor casting yapıyorum as ile UIImage a çevirmesi için. Normalde originalImage kullanılabilir fakat editleyebilsin diy kullanıcı .editedImage kullandım
        imageView.image = info[.editedImage] as? UIImage
        //açılan picker'ı kapatmak için self.dismiss. completion -> kapatılınca bir şey yapılmasını istiyorsak oraya yazıyoruz.
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
