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
    static func defaultLetValue() -> Self
}


extension String : Letable {
    public static func defaultLetValue() -> String {
        return ""
    }
}
extension Int: Letable {
    public static func defaultLetValue() -> Int {
        return 0
    }
}

extension UInt: Letable {
    public static func defaultLetValue() -> UInt {
        return 0
    }
}

extension Int8 : Letable {
    public static func defaultLetValue() -> Int8 {
        return 0
    }
}

extension UInt8 : Letable {
    public static func defaultLetValue() -> UInt8 {
        return 0
    }
}

extension Int16 : Letable{
    public static func defaultLetValue() -> Int16 {
        return 0
    }
}

extension UInt16 : Letable {
    public static func defaultLetValue() -> UInt16 {
        return 0
    }
}
extension Int32 : Letable {
    public static func defaultLetValue() -> Int32 {
        return 0
    }
}

extension UInt32 : Letable {
    public static func defaultLetValue() -> UInt32 {
        return 0
    }
}

extension Int64 : Letable {
    public static func defaultLetValue() -> Int64 {
    return 0
    }
}

extension UInt64 : Letable {
    public static func defaultLetValue() -> UInt64 {
        return 0
    }
}

extension Bool : Letable {
    public static func defaultLetValue() -> Bool {
        return false
    }
}
extension Array: Letable {
    public static func defaultLetValue() -> Array<Element> {
        return Array()
    }
}
extension Dictionary : Letable {
    public static func defaultLetValue() -> Dictionary<Key, Value> {
        return Dictionary()
    }
}


extension Optional : Letable where Wrapped: Letable {
    public static func defaultLetValue() -> Optional<Wrapped> {
        return Optional.init(Wrapped.defaultLetValue())
    }
}

public
extension Optional where Wrapped : Letable {
  var `let`:Wrapped {
        switch self {
        case .none:
            return Wrapped.defaultLetValue()
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
