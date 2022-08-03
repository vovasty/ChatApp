// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let allModels = try AllModels(json)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - AllModels

public struct AllModels: Codable, Hashable {
    public let list: MessageList?
    public let newMessage: NewMessage?

    public init(list: MessageList?, newMessage: NewMessage?) {
        self.list = list
        self.newMessage = newMessage
    }
}

// MARK: AllModels convenience initializers and mutators

public extension AllModels {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AllModels.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        list: MessageList?? = nil,
        newMessage: NewMessage?? = nil
    ) -> AllModels {
        AllModels(
            list: list ?? self.list,
            newMessage: newMessage ?? self.newMessage
        )
    }

    func jsonData() throws -> Data {
        try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        String(data: try jsonData(), encoding: encoding)
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - MessageList

public struct MessageList: Codable, Hashable {
    public let body: [String: [Message]]
    public let statusCode: Int

    public init(body: [String: [Message]], statusCode: Int) {
        self.body = body
        self.statusCode = statusCode
    }
}

// MARK: MessageList convenience initializers and mutators

public extension MessageList {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MessageList.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        body: [String: [Message]]? = nil,
        statusCode: Int? = nil
    ) -> MessageList {
        MessageList(
            body: body ?? self.body,
            statusCode: statusCode ?? self.statusCode
        )
    }

    func jsonData() throws -> Data {
        try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        String(data: try jsonData(), encoding: encoding)
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Message

public struct Message: Codable, Hashable {
    public let message, subject: String

    public init(message: String, subject: String) {
        self.message = message
        self.subject = subject
    }
}

// MARK: Message convenience initializers and mutators

public extension Message {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Message.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        message: String? = nil,
        subject: String? = nil
    ) -> Message {
        Message(
            message: message ?? self.message,
            subject: subject ?? self.subject
        )
    }

    func jsonData() throws -> Data {
        try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        String(data: try jsonData(), encoding: encoding)
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - NewMessage

public struct NewMessage: Codable, Hashable {
    public let message: String
    public let operation: Operation
    public let subject, user: String

    public init(message: String, operation: Operation, subject: String, user: String) {
        self.message = message
        self.operation = operation
        self.subject = subject
        self.user = user
    }
}

// MARK: NewMessage convenience initializers and mutators

public extension NewMessage {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(NewMessage.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        message: String? = nil,
        operation: Operation? = nil,
        subject: String? = nil,
        user: String? = nil
    ) -> NewMessage {
        NewMessage(
            message: message ?? self.message,
            operation: operation ?? self.operation,
            subject: subject ?? self.subject,
            user: user ?? self.user
        )
    }

    func jsonData() throws -> Data {
        try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        String(data: try jsonData(), encoding: encoding)
    }
}

public enum Operation: String, Codable, Hashable {
    case addMessage = "add_message"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
