//
//  ViewController.swift
//  IBAN Storage
//
//  Created by Okan Aktas on 17.06.2025.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var idArray: [UUID] = []
    var bankArray: [String] = []
    var ibanArray: [String] = []
    var imageArray: [UIImage] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTapped)
        )

        getData()
    }

    func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Values")
        fetchRequest.returnsObjectsAsFaults = false

        do {
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {

                if let imageData = result.value(forKey: "image") as? Data,
                   let image = UIImage(data: imageData) {
                    imageArray.append(image)
                }

                if let id = result.value(forKey: "id") as? UUID {
                    idArray.append(id)
                }

                if let bank = result.value(forKey: "bank") as? String {
                    bankArray.append(bank)
                }

                if let iban = result.value(forKey: "iban") as? String {
                    ibanArray.append(iban)
                }
            }

            tableView.reloadData()

        } catch {
            print("Veri çekme hatası: \(error.localizedDescription)")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(bankArray.count, ibanArray.count, imageArray.count)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        var content = cell.defaultContentConfiguration()

        if indexPath.row < bankArray.count {
            content.text = bankArray[indexPath.row]
        }

        if indexPath.row < ibanArray.count {
            content.secondaryText = ibanArray[indexPath.row]
        }

        if indexPath.row < imageArray.count {
            content.image = imageArray[indexPath.row]
        }

        cell.contentConfiguration = content
        return cell
    }

    @objc func addTapped() {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
}
