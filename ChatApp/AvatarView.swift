//
//  AvatarView.swift
//  ChatApp
//
//  Created by Vladimir Solomenchuk on 8/2/22.
//

import SwiftUI

struct AvatarView: View {
    let name: String

    var body: some View {
        Text(name)
            .font(.footnote)
            .frame(width: 50, height: 50)
            .background(.gray)
            .cornerRadius(25)
            .lineLimit(1)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(name: "meeeeeeeeeee")
    }
}
