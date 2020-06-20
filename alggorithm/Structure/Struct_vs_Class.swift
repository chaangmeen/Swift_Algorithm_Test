//
//  Struct_vs_Class.swift
//  alggorithm
//
//  Created by 전창민 on 2020/06/19.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation


struct Person {
    var firstName: String
}

class Address {
    var street: String
    init(street: String) {
        self.street = street
    }
}

let person = Person(firstName: "asdf")
//person.firstName = "asdf"
