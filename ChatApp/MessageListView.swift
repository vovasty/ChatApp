//
//  MessageList.swift
//  ChatApp
//
//  Created by Vladimir Solomenchuk on 8/2/22.
//

import SwiftUI
import ViewModel

struct MessageListview: View {
    @EnvironmentObject private var viewModel: ViewModel
    @State private var error: Error?

    var body: some View {
        ScrollViewReader { scrollView in
            List {
                if viewModel.messages.isEmpty {
                    HStack {
                        Spacer()
                        Text("Nothing to see here")
                            .listRowSeparator(.hidden)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .listRowSeparator(.hidden)
                } else {
                    ForEach(viewModel.messages) { message in
                        MessageView(message: message)
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .refreshable {
                Task.init {
                    do {
                        try await viewModel.update()
                    } catch {
                        self.error = error
                    }
                }
            }
            .errorAlert(error: $error)
            .onChange(of: viewModel.messages) { _ in
                // scroll to the bottom on update
                guard !viewModel.messages.isEmpty else { return }
                scrollView.scrollTo(viewModel.messages[viewModel.messages.count - 1])
            }
        }
    }
}

struct MessageListView_Previews: PreviewProvider {
    private static let preview = ViewModel.preview

    static var previews: some View {
        MessageListview()
            .environmentObject(preview)
    }
}
