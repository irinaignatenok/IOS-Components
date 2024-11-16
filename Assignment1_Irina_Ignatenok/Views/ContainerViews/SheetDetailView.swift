//
//  SheetDetailView.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-13.
//

import SwiftUI

struct SheetDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State private var showingCode = false
    @State private var  isPresented = false
    @State private var  isPresentedSheet = false
    @State var selectedDetent: PresentationDetent = .large
    var body: some View {
        NavigationStack{
            List {
                ButtonWithLabel(label: "Alert") {
                    showingCode.toggle()
                }
                
                HStack {
                    Text("Show Sheet")
                    
                    Spacer()
                    
                    Button(action: {
                        isPresentedSheet = true
                    }, label: {
                        Text("Show Sheet")
                    })
                    .buttonStyle(.borderedProminent)
                    
                }
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
        .sheet(isPresented: $isPresentedSheet){
            VStack{
                Text("Sheet is Presented")
                    .font(.title)
                Button(action: {
                    isPresentedSheet = false
                }, label: {
                    Text("Dismiss")
                })
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .foregroundColor(.blue)
                .padding()
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray)
            .presentationDetents([.medium, .large, .fraction(0.25), .height(600)], selection: .constant(.large))
        }
    }
}

#Preview {
    SheetDetailView(component: Component(name: "", iconName: "", category: ""), viewModel:ComponentListViewModel())
}
