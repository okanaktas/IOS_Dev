//
//  Person.swift
//  TableView_Classes
//
//  Created by Okan Aktas on 6.06.2025.
//

import Foundation
import UIKit

class Person {
    
    var name : String
    var job : String
    var age : Int
    var image : UIImageView
    
    init(name : String, job : String, age : Int, imageView : UIImageView){
        self.name = name
        self.job = job
        self.age = age
        self.image = imageView
    }
    
}
