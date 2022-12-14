//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Vladimir Solomenchuk on 8/2/22.
//

import Network
import SwiftUI
import ViewModel

@main
struct ChatAppApp: App {
    private func makeViewModel() -> ViewModel {
        let api = API(url: Config.apiEndpoint)
        return ViewModel(networkClient: api)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(makeViewModel())
        }
    }
}
