//
//  File.swift
//  
//
//  Created by sk on 2021/3/3.
//

import XCTest
@testable import AppYard

class PropertyDefaultTest: XCTestCase {
    fileprivate  struct PropertyDefault : LetCodable {
        static func defaultValue() -> PropertyDefaultTest.PropertyDefault {
            return self.init()
        }
        
        @DefaultOptionalWrapper()
        var stringValue: String?
        
        @DefaultOptionalWrapper()
        var boolValue: Bool?
        
        @DefaultOptionalWrapper(true)
        var trueValue: Bool?
        
        @DefaultOptionalWrapper()
        var person:Person?
    }
    
    fileprivate struct Person : LetCodable {
        @DefaultOptionalWrapper("")
        var name:String
        @DefaultOptionalWrapper(0)
        var age:Int
        static func defaultValue() -> PropertyDefaultTest.Person {
            return Person()
        }
    }
    
    func testBoolProperty() {
        let boolDefault:PropertyDefault = PropertyDefault.init()
        XCTAssertFalse(boolDefault.boolValue.let,"默认数据应该是false 实际为\(boolDefault.boolValue.let)")
    }
    
    func testBoolPropertyTrue() {
        let trueBoolDefault: PropertyDefault = PropertyDefault()
        
        XCTAssertTrue(trueBoolDefault.trueValue.let,"默认数据应该是true, 实际值为\(trueBoolDefault.trueValue.let)")
    }
    
    func testJson() {
        let dict = ["trueValue":true]
        let jsonData = try! JSONEncoder().encode(dict)
        let jsonStr = String(data: jsonData, encoding: .utf8)
       let decoderObj = try! JSONDecoder().decode(PropertyDefault.self, from: jsonData)
        
    }
    
    
    static var allTests = [
        ("testBoolProperty", testBoolProperty),
        ("testBoolPropertyTrue",testBoolPropertyTrue),
        ("testJson",testJson)
    ]
}
