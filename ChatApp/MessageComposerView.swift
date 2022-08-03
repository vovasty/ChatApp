//
//  MessageComposerView.swift
//  ChatApp
//
//  Created by Vladimir Solomenchuk on 8/2/22.
//

import SwiftUI
import ViewModel

struct MessageComposerView: View {
    @EnvironmentObject private var viewModel: ViewModel

    @State private var message: String = ""
    @State private var subject: String = ""
    @State private var error: Error?

    var body: some View {
        HStack {
            VStack {
                TextField("Subject", text: $subject)
                TextField("Message", text: $message)
            }
            Button("Send") {
                Task.init {
                    do {
                        try await viewModel.send(subject: subject, message: message)
                        subject = ""
                        message = ""
                    } catch {
                        self.error = error
                    }
                }
            }
            .disabled(message.isEmpty)
            .errorAlert(error: $error)
        }
    }
}

struct MessageComposerView_Previews: PreviewProvider {
    static var previews: some View {
        MessageComposerView()
    }
}
