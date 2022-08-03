import DataModel
import Foundation
import ViewModel

public struct API: NetworkClient {
    public enum APIError: Error {
        /// indicates bad response code
        case badResponseCode
        case badData
    }

    public enum ResponseCodes: Int {
        case ok = 200
    }

    private let url: URL
    private let urlSession = URLSession.shared

    public init(url: URL) {
        self.url = url
    }

    public func list() async throws -> [String: [Message]] {
        let (data, _) = try await urlSession.data(from: url)
        let list = try MessageList(malformed: data)
        guard ResponseCodes(rawValue: list.statusCode) == ResponseCodes.ok else {
            throw APIError.badResponseCode
        }
        return list.body
    }

    public func send(message: NewMessage) async throws {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        _ = try await urlSession.upload(for: request, from: try message.jsonData())
    }
}
