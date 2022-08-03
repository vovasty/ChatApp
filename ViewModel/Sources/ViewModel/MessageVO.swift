//
//  MessageVO.swift
//
//
//  Created by Vladimir Solomenchuk on 8/2/22.
//

import DataModel
import Foundation

public struct MessageVO: Equatable, Hashable, Identifiable {
    public var id: String
    public let from: UserVO
    public let subject: String
    public let message: String

    init(id: String, from: UserVO, message: Message) {
        subject = message.subject
        self.message = message.message
        self.from = from
        self.id = id
    }
}

public extension MessageVO {
    init(id: String, from: UserVO, subject: String, message: String) {
        self.from = from
        self.subject = subject
        self.message = message
        self.id = id
    }
}
