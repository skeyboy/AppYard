import XCTest
@testable import AppYard

struct Video: Codable {
    
    @DefaultCodable var id: Int
    //只会在先encode 后decode才有效
    @DefaultCodable(22) var age: Int
    
    @DefaultCodable var title: String
    
    @DefaultCodable(true) var commentEnabled: Bool
    
    @DefaultCodable var person: Person
    
    @DefaultCodable var list:[Person]
    
    @DefaultCodable var xx: Person?
    
    @DefaultCodable(.b) var method: Method
}

enum Method: String ,Codable, DefaultCodableProtocol {
    static var defaultValue: Method {
        return .a
    }
    case a
    case b
}
struct Person : Codable ,DefaultCodableProtocol {
    @DefaultCodable<String>
    var name: String
    @DefaultCodable
    var age: Int
    public static let defaultValue = Person()
}

final class MyLibraryTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let json =   """
        {"id": 12345,"title":"jsut title" ,"list":[{"name":"我是AAAA,只用名字"},{"age":18},{"age":28,"name":"Lee"}], "commentEnabled": 123}
        """
        let jsonData = json.data(using: .utf8)!
        let value = try! JSONDecoder().decode(Video.self, from: jsonData)
        let encode = try! JSONEncoder().encode(value)
        
        let decoder = try! JSONDecoder().decode(Video.self, from: encode)
        decoder.id
        let  reEncoder = try! JSONEncoder().encode(decoder)
        let reDecoder = try! JSONDecoder().decode(Video.self, from: reEncoder)
    }
    
    func testNext() {
        let video = Video()
        let videoEncodeValue = try! JSONEncoder().encode(video)
        
        let videoDecode = try! JSONDecoder().decode(Video.self, from: videoEncodeValue)
        
    }
    
    static var allTests = [
        ("testExample", testExample),
        ("testNext",testNext)
    ]
}
