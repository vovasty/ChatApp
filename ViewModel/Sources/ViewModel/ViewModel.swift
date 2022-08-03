import Combine
import DataModel

/// A network client
public protocol NetworkClient {
    /// Retrieves list of messages
    /// - Returns: a dictionary with messages
    func list() async throws -> [String: [Message]]

    /// Sends a message
    /// - Parameter message: a message
    func send(message: NewMessage) async throws
}

public class ViewModel: ObservableObject {
    // list of messages
    @Published public private(set) var messages: [MessageVO] = []

    /// Current user
    @Published public var user: String = ""

    public var isRegistered: Bool {
        !user.isEmpty
    }

    @Published public var isSending: Bool = false

    private var networkClient: NetworkClient

    /// Creates a new instance
    /// - Parameter networkClient: a network client.
    public init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }

    /// Update list of messages
    @MainActor
    public func update() async throws {
        isSending = true
        defer { isSending = false }
        let messages = try await networkClient.list()
        self.messages = messages.enumerated().flatMap { entry -> [MessageVO] in
            let user = UserVO(name: entry.element.key, isCurrent: isCurrent(user: entry.element.key))
            return entry.element.value.enumerated().map {
                MessageVO(id: "\(entry.element.key)_\($0.offset)", from: user, message: $0.element)
            }
        }
    }

    /// Sends a message
    /// - Parameter message: a message.
    @MainActor
    public func send(subject: String, message: String) async throws {
        isSending = true
        defer { isSending = false }
        let message = NewMessage(message: message, operation: .addMessage, subject: subject, user: user)
        _ = try await networkClient.send(message: message)
        try await update()
    }

    /// Check if the specified user is current
    /// - Parameter user: a user to check
    /// - Returns: true if current, false otherwise.
    private func isCurrent(user: String) -> Bool {
        self.user == user
    }
}
