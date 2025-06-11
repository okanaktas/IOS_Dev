//
//  Person.swift
//  Recap
//
//  Created by Okan Aktas on 11.06.2025.
//

import Foundation
import UIKit

class Person{
    
    var image : UIImage
    var name : String
    var birthday : Int
    
    init(image: UIImage, name : String, birthday : Int){
        self.image = image
        self.name = name
        self.birthday = birthday
    }
}
