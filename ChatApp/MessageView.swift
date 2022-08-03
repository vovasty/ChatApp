//
//  MessageView.swift
//  ChatApp
//
//  Created by Vladimir Solomenchuk on 8/2/22.
//

import SwiftUI
import ViewModel

struct MessageView: View {
    let message: MessageVO

    var body: some View {
        HStack {
            if message.from.isCurrent {
                Spacer()
            } else {
                AvatarView(name: message.from.name)
            }
            VStack(alignment: .leading) {
                Text(message.subject)
                    .multilineTextAlignment(.leading)
                    .font(.footnote)
                Text(message.message)
                    .multilineTextAlignment(.leading)
            }
            .padding(10)
            .foregroundColor(message.from.isCurrent ? .white : .black)
            .background(message.from.isCurrent ? .blue : Color(UIColor(red: 240 / 255, green: 240 / 255, blue: 240 / 255, alpha: 1.0)))
            .cornerRadius(10)
        }
    }
}

struct ReceivedMessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: MessageVO(id: "1", from: UserVO(name: "bob", isCurrent: true), subject: "re: Hi", message: "helllooo"))
        MessageView(message: MessageVO(id: "1", from: UserVO(name: "bob", isCurrent: false), subject: "re: Hi", message: "helllooo"))
    }
}
