//
//  File.swift
//  
//
//  Created by sk on 2021/3/3.
//

import Foundation

typealias LetCodable = Codable & Letable

@propertyWrapper
struct DefaultOptionalWrapper<T: Letable> : Codable where T: Codable {
    var wrappedValue:T
    init(_ wrappedValue:T = T.defaultValue()) {
        self.wrappedValue = wrappedValue
    }
   
    func encode(to encoder: Encoder) throws {
      var container = encoder.singleValueContainer()
       try? container.encode(wrappedValue)
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.singleValueContainer()
        wrappedValue =  (try? container?.decode(T.self)) ?? T.defaultValue()
    }
}

