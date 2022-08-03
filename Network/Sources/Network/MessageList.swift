//
//  MessageList.swift
//
//
//  Created by Vladimir Solomenchuk on 8/3/22.
//

import DataModel
import Foundation

private struct MalformedMessageList: Decodable {
    let statusCode: Int
    let body: String
}

extension MessageList {
    /// Workaround for api bug, when body is passes as a stringified json.
    /// Works for good and bad data
    /// - Parameter data: a data with json
    init(malformed data: Data) throws {
        do {
            self = try MessageList(data: data)
        } catch {
            let decoder = JSONDecoder()
            let malformed = try decoder.decode(MalformedMessageList.self, from: data)
            guard let data = malformed.body.data(using: .utf8) else {
                throw API.APIError.badData
            }
            let body = try decoder.decode([String: [Message]].self, from: data)
            self = MessageList(body: body, statusCode: malformed.statusCode)
        }
    }
}
