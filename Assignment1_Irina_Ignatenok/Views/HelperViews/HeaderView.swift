//
//  HeaderView.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-11.
//

import SwiftUI

import SwiftUI

struct HeaderView: View {
    var title: String
    @Binding var isShown: Bool

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Button(action: {
                isShown.toggle()
            }) {
                Image(systemName: "book")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.accentColor)
            }
        }
//        .padding()
    }
}
//#Preview {
//    HeaderView(title: "String", isShown: $isShown)
//}
