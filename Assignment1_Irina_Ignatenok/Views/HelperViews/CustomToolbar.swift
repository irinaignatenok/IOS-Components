//
//  CustomToolbar.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-12.
//
import SwiftUI
//to present NavBar with text and Button
struct CustomToolbar: View {
    var title: String
    @Binding var isPresented: Bool

    var body: some View {
        HStack {   
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
          
            Button(action: {
                isPresented.toggle()
            }) {
                Image(systemName: "book")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.accentColor)
            }
            .frame(alignment: .trailing)
            Spacer()
        }
        .padding()
    }
}
