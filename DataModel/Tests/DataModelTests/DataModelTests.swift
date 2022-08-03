@testable import DataModel
import XCTest

final class DataModelTests: XCTestCase {
    func testMessageList() throws {
        guard let url = Bundle.module.url(forResource: "MessageList.json", withExtension: nil) else {
            XCTFail("no test data")
            return
        }
        let rawData = try Data(contentsOf: url)
        let data = try MessageList(data: rawData)
        XCTAssertEqual(data.statusCode, 200)
        XCTAssertEqual(data.body.keys.sorted(), ["bob", "dan"])
        XCTAssertEqual(data.body["bob"]?.first, Message(message: "bob bob bob", subject: "bob stuff"))
    }

    func testNewMessage() throws {
        guard let url = Bundle.module.url(forResource: "NewMessage.json", withExtension: nil) else {
            XCTFail("no test data")
            return
        }
        let rawData = try Data(contentsOf: url)
        let data = try NewMessage(data: rawData)
        XCTAssertEqual(data.operation, .addMessage)
        XCTAssertEqual(data.user, "dan")
        XCTAssertEqual(data.subject, "pets")
        XCTAssertEqual(data.message, "cats are grumpy")
    }
}
