//
//  Values.swift
//  IBAN Storage
//
//  Created by Okan Aktas on 17.06.2025.
//

import Foundation

class Values {
    var id : UUID = UUID()
    var bank : String = ""
    var iban : String = ""
    
    init(id : UUID, bank : String, iban : String){
        self.id = id
        self.bank = bank
        self.iban = iban
    }
}
