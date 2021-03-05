//
//  File.swift
//  
//
//  Created by sk on 2021/2/25.
//

import Foundation
@testable import AppYard



struct Studnt: Letable {
    var name:String
    var id: Int
    
    static func defaultLetValue() -> Studnt {
        return Studnt(name: "", id: -1)
    }
}
