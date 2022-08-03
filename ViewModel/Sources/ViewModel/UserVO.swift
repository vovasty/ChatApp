//
//  UserVO.swift
//
//
//  Created by Vladimir Solomenchuk on 8/2/22.
//

import Foundation

public struct UserVO: Equatable, Hashable {
    public let name: String
    public let isCurrent: Bool

    public init(name: String, isCurrent: Bool) {
        self.name = name
        self.isCurrent = isCurrent
    }
}
