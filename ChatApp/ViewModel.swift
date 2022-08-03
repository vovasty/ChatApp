//
//  API.swift
//  ChatApp
//
//  Created by Vladimir Solomenchuk on 8/2/22.
//

@testable import DataModel
import Foundation
import ViewModel

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

    func send(message _: NewMessage) async throws {}
}

extension ViewModel {
    static let preview: ViewModel = {
        let url = Bundle.main.url(forResource: "MessageList.json", withExtension: nil)!
        let networkClient = LocalNetworkClient(url: url)
        let viewModel = ViewModel(networkClient: networkClient)
        return viewModel
    }()
}
