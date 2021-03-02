//
//  File.swift
//  
//
//  Created by sk on 2021/2/25.
//

#if os(iOS)
import Foundation
import UIKit

public protocol Letable  {
    static func defaultValue() -> Self
}


extension String : Letable {
    public static func defaultValue() -> String {
        return ""
    }
}
extension Int: Letable {
    public static func defaultValue() -> Int {
        return 0
    }
}

extension UInt: Letable {
    public static func defaultValue() -> UInt {
        return 0
    }
}

extension Int8 : Letable {
    public static func defaultValue() -> Int8 {
        return 0
    }
}

extension UInt8 : Letable {
    public static func defaultValue() -> UInt8 {
        return 0
    }
}

extension Int16 : Letable{
    public static func defaultValue() -> Int16 {
        return 0
    }
}

extension UInt16 : Letable {
    public static func defaultValue() -> UInt16 {
        return 0
    }
}
extension Int32 : Letable {
    public static func defaultValue() -> Int32 {
        return 0
    }
}

extension UInt32 : Letable {
    public static func defaultValue() -> UInt32 {
        return 0
    }
}

extension Int64 : Letable {
    public static func defaultValue() -> Int64 {
    return 0
    }
}

extension UInt64 : Letable {
    public static func defaultValue() -> UInt64 {
        return 0
    }
}

extension Bool : Letable {
    public static func defaultValue() -> Bool {
        return false
    }
}
extension Array: Letable {
    public static func defaultValue() -> Array<Element> {
        return Array()
    }
}
extension Dictionary : Letable {
    public static func defaultValue() -> Dictionary<Key, Value> {
        return Dictionary()
    }
}


extension Optional : Letable where Wrapped: Letable {
    public static func defaultValue() -> Optional<Wrapped> {
        return Optional.init(Wrapped.defaultValue())
    }
}

public
extension Optional where Wrapped : Letable {
  var `let`:Wrapped {
        switch self {
        case .none:
            return Wrapped.defaultValue()
        case .some(let value):
            return value
        }
    }
}

public extension Optional {
    @inlinable
    func `let`(_  block: (Wrapped)->Void) {
        switch self {
        case .none:
            break
        case .some(let value):
            block(value)
        }
    }
}



#endif
