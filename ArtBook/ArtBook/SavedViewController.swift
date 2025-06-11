//
//  SavedViewController.swift
//  ArtBook
//
//  Created by Okan Aktas on 12.06.2025.
//

import UIKit
import CoreData

class SavedViewController: UIViewController {
    
    var savedName : String?
    var savedUUID : UUID?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        
        let idString = savedUUID?.uuidString ?? ""
        
        fetchRequest.predicate = NSPredicate(format: "id == %@", idString)
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    if let name = result.value(forKey: "name") as? String{
                        nameLabel.text = name
                    }
                    if let artist = result.value(forKey: "artist") as? String{
                        artistLabel.text = artist
                    }
                    if let year = result.value(forKey: "year") as? Int{
                        yearLabel.text = String(year)
                    }
                    if let imageData = result.value(forKey: "image") as? Data{
                        let image = UIImage(data: imageData)
                        imageView.image = image
                    }
                }
            }
        }catch {
            print("Error")
        }
        
    }


}
