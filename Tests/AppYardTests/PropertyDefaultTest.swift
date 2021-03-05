import XCTest
@testable import AppYard

struct Video: Codable {
    
    @Default var id: Int
    
    @Default(22) var age: Int
    
    @Default var title: String
    
    @Default(true) var commentEnabled: Bool
    
    @Default var person: Person
    
    @Default var list:[Person]
    
    @Default var xx: Person?
    
    @Default(.b) var method: Method
}

enum Method: String ,Codable, DefaultValue {
    static var defaultValue: Method {
        return .a
    }
    case a
    case b
}
struct Person : Codable ,DefaultValue {
    @Default<String>
    var name: String
    @Default
    var age: Int
    public static let defaultValue = Person()
}

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
