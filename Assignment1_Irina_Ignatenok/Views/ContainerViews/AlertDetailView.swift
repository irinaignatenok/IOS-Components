//
//  AlertDetailView.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-13.
//

import SwiftUI

struct AlertDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State private var showingCode = false
    @State private var  isPresented = false
    @State var isPresentedAlert: Bool = false
    @State var isPresentedMulti: Bool = false
    
    var body: some View {
        NavigationStack{
            List{
                ButtonWithLabel(label: "Alert") {
                    showingCode.toggle()
                }
                Button(action: {
                    isPresented = true
                }, label: {
                    Text("Show Alert")
                })
                
                Button(action: {
                    isPresentedMulti = true
                }, label: {
                    Text("Show Multi-Option Alert")
                })
            }
            .alert("Alert Title", isPresented: $isPresented) {
                Button("Cancel", role: .cancel) {
                    isPresented = false
                }
                
                Button("Delete", role: .destructive) {
                    isPresented = false
                }
            } message: {
                Text("Test Message")
            }
            .alert("Multi-Alert Title", isPresented: $isPresentedMulti) {
                Button("Save to iCloud", role: nil) {
                    isPresentedMulti = false
                }
                
                Button("Save to Files", role: nil) {
                    isPresentedMulti = false
                }
                
                Button("Cancel", role: .cancel) {
                    isPresentedMulti = false
                }
                
                Button("Delete", role: .destructive) {
                    isPresentedMulti = false
                }
            } message: {
                Text("Where would you like to save this file?")
            }
        }
        .toolbar {
            CustomToolbar(title: component.name, isPresented: $isPresented)
        }
        .sheet(isPresented: $showingCode){
            CodeSheet(isPresented: $showingCode, component: component, viewModel: viewModel)
        }
        .sheet(isPresented: $isPresented) {
            SFSafariView(url: URL(string: component.documentationURL)!)
        }
        
    }
}

#Preview {
    AlertDetailView(component: Component(name: "", iconName: "", category: ""), viewModel: ComponentListViewModel())
}
