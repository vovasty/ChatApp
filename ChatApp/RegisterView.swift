//
//  RegisterView.swift
//  ChatApp
//
//  Created by Vladimir Solomenchuk on 8/2/22.
//

import SwiftUI
import ViewModel

struct RegisterView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @State private var user: String = ""

    var body: some View {
        VStack {
            TextField("Your name?", text: $user)
                .frame(width: 100, alignment: .trailing)
                .autocapitalization(.none)
            Button("Register") {
                viewModel.user = user
            }
            .disabled(user.isEmpty)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(ViewModel.preview)
    }
}
