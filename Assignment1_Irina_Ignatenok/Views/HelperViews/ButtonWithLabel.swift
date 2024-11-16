//
//  ButtonWithLabel.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-12.
//

import SwiftUI
//helper struct to present Text with Icon 
struct ButtonWithLabel: View {
    var label: String
    var action: () -> Void

    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
            Spacer()
            Button(action: action) {
                Image(systemName: "curlybraces")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.accentColor)
            }
        }
    }
}
