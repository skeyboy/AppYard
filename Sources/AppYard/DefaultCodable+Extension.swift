//
//  File.swift
//  
//
//  Created by LiYuLong on 2021/3/8.
//

import Foundation

extension Optional : DefaultValue where Wrapped: Codable, Wrapped:DefaultValue  {
    public typealias Value = Optional<Wrapped>
    public static var defaultValue: Optional<Wrapped> {
        return Optional.init(Wrapped.defaultValue as! Wrapped)
    }
    
}

extension Array :DefaultValue where Element:DefaultValue , Element: Codable {
    public typealias Value = Array<Element>
    public static var defaultValue: Array<Element> {
        return []
    }
}


extension Int: DefaultValue {
    public static let defaultValue = 0
}
extension String: DefaultValue {
    public static let defaultValue = ""
}
extension Bool: DefaultValue {
    public static let defaultValue = false
}
