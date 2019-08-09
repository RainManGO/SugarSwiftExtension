import XCTest
import SugarSwiftExtension

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testIntRound(){
        print(1234.rounded)
        XCTAssertTrue(0.rounded == 0, "bingo")
        XCTAssertTrue(3.rounded == 3, "bingo")
        XCTAssertTrue(123.rounded == 120, "bingo")
        XCTAssertTrue(1234.rounded == 1230, "bingo")
    }
    
    func testStr() {
        print("123"[0...1])
        XCTAssertTrue("123"[2] == "3", "sub error")
        XCTAssertTrue("123"[0...1] == "12", "sub error")
        
        XCTAssertTrue("".isBlank, "error blank")
    }
    
    func testArray(){
        let a = Optional([1,2,3])
        let b = Optional([1,2,3])
        XCTAssert(a==b)
        XCTAssertTrue([1,2,3,4,5].intersection([1,2,5],[1,5]) == [1,5], "error array intersection")
    }
    
    func testDictionary() {
        let dic = ["1":1,"2":2,"3":3]
        let dic1 = ["1":1,"2":2,"5":8]
        let dic2 = ["1":1,"2":5]
        let result = dic.intersection(dic1,dic2)
        XCTAssertTrue(result == ["1":1], "error dic intersection")
    }
    
}
