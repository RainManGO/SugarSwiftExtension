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
        print(1234.toRound)
        XCTAssertTrue(0.toRound == 0, "bingo")
        XCTAssertTrue(3.toRound == 3, "bingo")
        XCTAssertTrue(123.toRound == 120, "bingo")
        XCTAssertTrue(1234.toRound == 1230, "bingo")
    }
    
}
