import DataModel
@testable import Network
import XCTest

final class NetworkTests: XCTestCase {
    func testGood() throws {
        guard let url = Bundle.module.url(forResource: "MessageList.json", withExtension: nil) else {
            XCTFail("no test data")
            return
        }
        let rawData = try Data(contentsOf: url)
        let list = try MessageList(malformed: rawData)
        XCTAssertEqual(list.body.count, 2)
    }

    func testBad() throws {
        guard let url = Bundle.module.url(forResource: "MessageListBad.json", withExtension: nil) else {
            XCTFail("no test data")
            return
        }
        let rawData = try Data(contentsOf: url)
        let list = try MessageList(malformed: rawData)
        XCTAssertEqual(list.body.count, 1)
    }
}
