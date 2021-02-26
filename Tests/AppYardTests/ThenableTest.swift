//
//  File.swift
//  
//
//  Created by sk on 2021/2/26.
//

import Foundation
import XCTest

#if os(iOS) || os(tvOS)
import UIKit
#endif
@testable import AppYard
final class AppYardThenableTests: XCTestCase {
    
    func testThenableThen() {
        let label =  UILabel().then {
            $0.textColor = .red
            $0.textAlignment = .center
        }
        XCTAssert(label.textAlignment == .center, "\(label.textAlignment)")
        XCTAssert(label.textColor == UIColor.red, "\(label.textColor)")
    }
    
    func testThenableDo() {
        UserDefaults.standard.do {
            $0.set("aa", forKey: "aKey")
            $0.synchronize()
        }
        XCTAssert(UserDefaults.standard.string(forKey: "aKey").let == "aa", "aKey 对应的数据应是 aa")
        
    }
    
    func testThenableWhen() {
      let rect =  CGRect(x: 0, y: 0, width: 0, height: 0).with {
            $0.origin.x = 100
            $0.size.width = 100
        }
        XCTAssert(rect.origin.x == 100, "CGRect.x == \(rect.origin.x)")
        XCTAssert(rect.size.width == 100 , "CGRect.width == \(rect.size.width)")
        
    }
    
    static var allTests = [
        ("testThenableThen",testThenableThen),
        ("testThenableDo",testThenableDo),
        ("testThenableWhen",testThenableWhen)
    ]
    
}
