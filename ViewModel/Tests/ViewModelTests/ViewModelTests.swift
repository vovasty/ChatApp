import DataModel
@testable import ViewModel
import XCTest

private class LocalNetworkClient: NetworkClient {
    private let url: URL
    private let urlSession = URLSession.shared

    init(url: URL) {
        self.url = url
    }

    func list() async throws -> [String: [Message]] {
        let (data, _) = try await urlSession.data(from: url)
        return try MessageList(data: data).body
    }

    func send(message _: NewMessage) async throws {
        fatalError("not implemented")
    }
}

final class ViewModelTests: XCTestCase {
    func testUpdate() async throws {
        guard let url = Bundle.module.url(forResource: "MessageList.json", withExtension: nil) else {
            XCTFail("no test data")
            return
        }

        let networkClient = LocalNetworkClient(url: url)
        let viewModel = ViewModel(networkClient: networkClient)
        XCTAssert(viewModel.messages.isEmpty)

        try await viewModel.update()
        XCTAssertFalse(viewModel.messages.isEmpty)
    }
}
