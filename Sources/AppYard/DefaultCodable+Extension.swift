//
//  File.swift
//  
//
//  Created by LiYuLong on 2021/3/8.
//

import Foundation

extension Optional : DefaultCodableProtocol where Wrapped: Codable, Wrapped:DefaultCodableProtocol  {
    public typealias Value = Optional<Wrapped>
    public static var defaultValue: Optional<Wrapped> {
        return Optional.init(Wrapped.defaultValue as! Wrapped)
    }
    
}

extension Array :DefaultCodableProtocol where Element:DefaultCodableProtocol , Element: Codable {
    public typealias Value = Array<Element>
    public static var defaultValue: Array<Element> {
        return []
    }
}


extension Int: DefaultCodableProtocol {
    public static let defaultValue = 0
}
extension String: DefaultCodableProtocol {
    public static let defaultValue = ""
}
extension Bool: DefaultCodableProtocol {
    public static let defaultValue = false
}
