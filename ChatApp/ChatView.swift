//
//  ChatView.swift
//  ChatApp
//
//  Created by Vladimir Solomenchuk on 8/2/22.
//

import SwiftUI
import ViewModel

struct ChatView: View {
    @EnvironmentObject private var viewModel: ViewModel

    var body: some View {
        VStack {
            MessageListview()
            MessageComposerView()
                .padding(10)
                .disabled(viewModel.isSending)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(ViewModel.preview)
    }
}
