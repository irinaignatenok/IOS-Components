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
    @State private var showingDocumentation = false
    @State private var isTextField = false
    @State private var username:String = ""
    @State private var isSecure = false
    @State private var isTextArea = false
    
    var body: some View {
        NavigationStack {
            
//            List of all text components(Label, Text, Text Field, Security Field, Text Area)
            List {
                Section("Label"){
                    HeaderView(title: "Label", isShown: $showingDocumentation)
                    HStack{
                        Label("Rain", systemImage: "cloud.rain")
                            .labelStyle(.automatic)
                        Spacer()
                        Text("Automatic")
                            .foregroundStyle(.secondary)
                    }
                    HStack{
                        Label(
                            title: { Text("Rain") },
                            icon: { Image(systemName: "cloud.rain") }
                        )
                        .labelStyle(.titleAndIcon)
                        Spacer()
                        Text("Title and Icon")
                            .foregroundStyle(.secondary)
                    }
                    HStack{
                        Label("Rain", systemImage: "cloud.rain")
                            .labelStyle(.titleOnly)
                        Spacer()
                        Text("Title Only")
                            .foregroundStyle(.secondary)
                    }
                    HStack{
                        Label("Rain", systemImage: "cloud.rain")
                            .labelStyle(.iconOnly)
                        Spacer()
                        Text("Icon Only ")
                            .foregroundStyle(.secondary)
                    }
                }
                Section("Text"){
                    HeaderView(title: component.name, isShown: $isPresented)
                    HStack{
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.")
                    }
                    
                }
                Section("Text Field"){
                    HeaderView(title: "Text Field", isShown: $isTextField)
                    TextField("Enter your name", text: $userInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Text(userInput)
                    
                }
                Section("Secure Field"){
                    HeaderView(title: "Secure Field", isShown: $isSecure)
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                Section("Text Area"){
                    HeaderView(title: "Text Area", isShown: $isTextArea)
                    TextEditor(text: $textAreaInput)
                        .border(Color.secondary, width: 1)
                        .padding()
                        .frame(height: 150)
                    Text("Personal Details: ")
                        .foregroundStyle(.blue)
                        .font(.subheadline)
                    Text("\(textAreaInput)")
                        .font(.body)
                        .padding()
                    
                }
            }
//            Sheets with apple documentation
            .sheet(isPresented: $showingDocumentation) {
                SFSafariView(url:  URL(string:"https://developer.apple.com/documentation/swiftui/label")!)
            }
            .sheet(isPresented: $isTextField) {
                SFSafariView(url:  URL(string:"https://developer.apple.com/documentation/swiftui/textfield")!)
            }
            .sheet(isPresented: $isSecure) {
                SFSafariView(url:  URL(string:"https://developer.apple.com/documentation/swiftui/securefield")!)
            }
            .sheet(isPresented: $isTextArea) {
                SFSafariView(url:  URL(string:"https://developer.apple.com/documentation/swiftui/texteditor")!)
            }
        }
        .navigationTitle("")
        .toolbar {
            CustomToolbar(title: component.name, isPresented: $isPresented)
        }
        .sheet(isPresented: $isPresented) {
            SFSafariView(url:URL(string: component.documentationURL)!)
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
