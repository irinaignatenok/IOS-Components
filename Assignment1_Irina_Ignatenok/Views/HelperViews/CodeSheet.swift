//
//  CodeSheet.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-12.
//

import SwiftUI
//        To show the code of components
struct CodeSheet: View {
    @Binding var isPresented: Bool
    var component: Component
    var viewModel: ComponentListViewModel
    
    var body: some View {

        NavigationStack {
            List {
                HStack {
                    Text(component.exampleCode)
                        .font(.subheadline)
                        .frame(maxWidth: 250, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    Button(action: {
                        viewModel.copyToClipboard(component.exampleCode)
                        viewModel.toggleTextColor()
                        viewModel.updateCopyButtonText()
                    }) {
                        Text(viewModel.copyButtonText)
                            .foregroundColor(viewModel.textColor)
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle(component.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Spacer()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Label("Close", systemImage: "xmark")
                    }
                }
            }
        }
    }
}


