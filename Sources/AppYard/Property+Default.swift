//
//  File.swift
//  
//
//  Created by sk on 2021/3/3.
//

import Foundation

typealias LetCodable = Codable & Letable

public protocol DefaultCodableProtocol {
    associatedtype Value: Codable
    static var defaultValue: Value { get }
}


@propertyWrapper
public struct DefaultCodable<T: DefaultCodableProtocol> where T == T.Value {
    public  var wrappedValue: T.Value
    var value:T.Value?
    public init(_ value: T.Value? = nil) {
        self.value = value
        if let value = value {
            wrappedValue = value
        } else {
            wrappedValue = T.defaultValue
        }
    }
    
}

extension DefaultCodable : Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try  container.encode(wrappedValue)
    }
}

extension DefaultCodable: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(T.Value.self)) ?? T.defaultValue
    }
}

extension KeyedDecodingContainer {
    func decode<T>(
        _ type: DefaultCodable<T>.Type,
        forKey key: Key
    ) throws -> DefaultCodable<T> where T: DefaultCodableProtocol {
        let value = (try decodeIfPresent(type, forKey: key))
        return value ?? DefaultCodable(T.defaultValue)
    }
    
}
