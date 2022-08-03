//
//  ContentView.swift
//  ChatApp
//
//  Created by Vladimir Solomenchuk on 8/2/22.
//

import SwiftUI
import ViewModel

struct ContentView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @State private var error: Error?

    var body: some View {
        if viewModel.isRegistered {
            ChatView()
                .onAppear {
                    Task.init {
                        do {
                            try await viewModel.update()
                        } catch {
                            self.error = error
                        }
                    }
                }
                .errorAlert(error: $error)
        } else {
            RegisterView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel.preview)
    }
}
