//
//  File.swift
//  
//
//  Created by sk on 2021/2/25.
//

import Foundation
#if os(iOS)
import UIKit
#endif

public
protocol Thenable {}

public
extension Thenable where Self : Any {
    
    func with(_ block: (inout Self)throws -> Void) rethrows -> Self {
        var copy = self
        try block(&copy)
        return copy
    }
    
    func `do`(_ block: (Self)throws -> Void) rethrows {
        try block(self)
    }
}


public
extension Thenable where Self: AnyObject {
    func then(_ block:(Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}



extension Array: Thenable {}
extension Dictionary: Thenable {}
extension Set: Thenable {}
extension NSObject: Thenable {}

#if os(iOS) || os(tvOS)
extension UIEdgeInsets : Thenable {}
extension UIOffset : Thenable {}
extension UIRectEdge: Thenable{}
#endif

#if !os(Linux)
extension CGPoint: Thenable {}
extension CGRect: Thenable {}
extension CGSize: Thenable {}
extension CGVector: Thenable {}
#endif
