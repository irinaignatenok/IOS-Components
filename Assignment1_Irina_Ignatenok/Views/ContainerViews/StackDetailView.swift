//
//  Stack.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-12.
//

import SwiftUI

struct StackDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State private var isPresented = false
    @State private var showingCode = false
    var body: some View {
        NavigationStack{
            List{
                ButtonWithLabel(label: "Stack") {
                    showingCode.toggle()
                }
                HeaderView(title: "Stack", isShown: $isPresented)
            }
        }
        .navigationTitle("")
                 .toolbar {
                     
                     CustomToolbar(title: component.name, isPresented: $isPresented)
                 }
    }
}

#Preview {
    StackDetailView(component: Component(name: "", iconName: "", category: ""), viewModel: ComponentListViewModel())
}
