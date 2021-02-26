import XCTest
@testable import AppYard


final class AppYardTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AppYard().text, "Hello, World!")
    }
    func testStringLetable() {
        var a:String?
        XCTAssert(a.let.isEmpty , "Optional<String> let 默认为空")
        var aa:String?
        aa.let { (v) in
            XCTAssert(false, "此时不会执行的")
        }
        
        let b:String? = "B"
        XCTAssert(b.let == "B", "此时的数据为\(b.let)")
        b.let { (v) in
            print(v)
            XCTAssert(b.let == "B", "此时的数据为\(v)")
        }
        
       
    }
    
    func testBoolLetable() {
        var c:Bool?
        XCTAssertFalse(c.let, "默认为false")
    }
    
    func testClassLetable() {
        
        var p:Person?
        p.let { (v) in
            XCTAssert(false, "此时不会执行")
        }
        
        p = Person(name:"Lee", age:32)
        p.let { (v) in
            XCTAssertTrue(v is Person)
        }
    }
    
    func testStructLetable() {
        var stu: Studnt?
        XCTAssert(stu.let.id == -1 && stu.let.name.isEmpty, "stud 默认值:\(stu.let)")
        stu = Studnt(name: "lee", id: 32)
        stu.let { (v) in
            XCTAssertTrue(v is Studnt)
        }
    }
    
    func testUILetable() {
        var viewController: UIViewController?
        viewController.let {
            $0.viewDidLoad()
        }
    }
    
    static var allTests = [
        ("testExample", testExample),
        ("testStringLetable",testStringLetable),
        ("testBoolLetable",testBoolLetable),
        ("testClassLetable",testClassLetable),
        ("testStructLetable",testStructLetable),
    ]
}
