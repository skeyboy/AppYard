//
//  File.swift
//  
//
//  Created by sk on 2021/2/25.
//

import Foundation
@testable import AppYard

class Person : Letable {
    var name: String?
    var age:Int?
    init(name:String? , age:Int?) {
        self.name = name
        self.age = age
    }
    
    static func defaultValue() -> Self {
        return Person(name: "", age: 0) as! Self
    }
}


struct Studnt: Letable {
    var name:String
    var id: Int
    
    static func defaultValue() -> Studnt {
        return Studnt(name: "", id: -1)
    }
}
