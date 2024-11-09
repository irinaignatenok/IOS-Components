//
//  TextDetailView.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-07.
//

import SwiftUI
import SafariServices

struct TextDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State private var userInput: String = ""
    @State private var password: String = ""
    @State private var textAreaInput: String = ""
    @State private var isPresented: Bool = false
//    @State private var searchURL: URL = URL(string: "https://developer.apple.com/documentation/swiftui/text")!
//    @State private var searchURLLabel: URL = URL(string: "https://developer.apple.com/documentation/swiftui/label")!
    @State private var showingDocumentation = false

    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text("Label")
                    Button(action: {
//                        isPresented.toggle()
                        showingDocumentation = true
                    }) {
                        Image(systemName: "book")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.accentColor)
                    }
                    .sheet(isPresented: $showingDocumentation) {
                        SFSafariView(url:  URL(string:"https://developer.apple.com/documentation/swiftui/label")!)
                    }
                    
                }
                VStack(alignment: .leading) {
                    Label("Sign in", systemImage: "person")
                        .font(.title)
                        .padding()
                    
                    TextField("Enter your name", text: $userInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextEditor(text: $textAreaInput)
                        .border(Color.secondary, width: 1)
                        .padding()
                        .frame(height: 150)
                    
                    Text("First Name: \(userInput)")
                        .font(.body)
                        .padding()
                    
                    Text("Personal Details: \(textAreaInput)")
                        .font(.body)
                        .padding()
                }
                .padding()
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Spacer() // Placeholder for left alignment
                }
                ToolbarItem(placement: .principal) {
                    Text(component.name)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center) // Center the title
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: "book")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .sheet(isPresented: $showingDocumentation) {
                SFSafariView(url:URL(string: component.documentationURL)!)
            }
        }
    }
}

struct TextDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mockComponent = Component(
            name: "Text",
            iconName: "textformat",
            category: "Text Input/Output",
            documentationURL: "https://developer.apple.com/documentation/swiftui/text",
            exampleCode: "Text(\"Hello, World!\")"
        )
        
        let viewModel = ComponentListViewModel()
        
        TextDetailView(component: mockComponent, viewModel: viewModel)
          
            
    }
}
