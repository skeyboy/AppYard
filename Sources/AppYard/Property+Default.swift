//
//  File.swift
//  
//
//  Created by sk on 2021/3/3.
//

import Foundation

typealias LetCodable = Codable & Letable

public protocol DefaultValue {
    associatedtype Value: Codable
    static var defaultValue: Value { get }
}


@propertyWrapper
struct Default<T: DefaultValue> where T == T.Value {
    var wrappedValue: T.Value
    var value:T.Value?
    init(_ value: T.Value? = nil) {
        self.value = value
        if let value = value {
            wrappedValue = value
        } else {
            wrappedValue = T.defaultValue
        }
    }
    
}

extension Default : Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
      try  container.encode(wrappedValue)
    }
}

extension Default: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
            wrappedValue = (try? container.decode(T.Value.self)) ?? T.defaultValue
    }
}

extension KeyedDecodingContainer {
    func decode<T>(
        _ type: Default<T>.Type,
        forKey key: Key
    ) throws -> Default<T> where T: DefaultValue {
        let value = (try decodeIfPresent(type, forKey: key))
        return value ?? Default(T.defaultValue)
    }
    
}
