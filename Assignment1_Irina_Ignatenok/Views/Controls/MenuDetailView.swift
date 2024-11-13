//
//  MenuDetailPage.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-11.
//
import SwiftUI
import SafariServices

struct MenuDetailView: View {
    @State private var showingCode = false
    @State private var isPresented = false
    @State private var textColor: Color = .accentColor
    @State private var copyButtonText: String = "Copy"
    @State private var clipboardContent: String = "No content"
    @State private var selectedAction: String = ""
    
    let component: Component
    
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text("Menu")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        showingCode.toggle()
                    }) {
                        Image(systemName: "curlybraces")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.accentColor)
                    }
                }

                // First Menu Section
                VStack {
                    HStack {
                        Menu("Show Menu with Control Group") {
                            ControlGroup {
                                Button(action: {
                                    // Code for pin action
                                }) {
                                    Image(systemName: "pin.fill")
                                }
                                
                                Button(action: {
                                    // Code for lock action
                                }) {
                                    Image(systemName: "lock")
                                }
                                
                                Button(action: {
                                    // Code for magnifying glass action
                                }) {
                                    Image(systemName: "magnifyingglass")
                                }
                            }
                            
                            Section {
                                Button(action: {
                                    // Code for Move File action
                                }) {
                                    Label("Move File", systemImage: "folder")
                                }
                                
                                Button(action: {
                                    // Code for New Folder action
                                }) {
                                    Label("New Folder", systemImage: "folder.badge.plus")
                                }
                            }
                        }
                    }
                    .padding()
                }

                // Second Menu Section
                VStack {
                    HStack {
                        Menu ("Show Menu"){
                            Button(action: {
                                // Cut action
                                clipboardContent = "Cut Content"
                                selectedAction = "Cut"
                            }) {
                                Label("Cut", systemImage: "scissors")
                            }
                            
                            Button(action: {
                                // Copy action
                                clipboardContent = "Copied Content"
                                selectedAction = "Copy"
                            }) {
                                Label("Copy", systemImage: "doc.on.doc")
                            }
                            
                            Button(action: {
                                // Paste action
                                clipboardContent = "Pasted Content"
                                selectedAction = "Paste"
                            }) {
                                Label("Paste", systemImage: "doc.on.clipboard")
                            }
                            
                            Button(action: {
                                // Delete action
                                clipboardContent = "Deleted Content"
                                selectedAction = "Delete"
                            }) {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                    .padding()
                } // End of Second Menu Section

            } // End of List
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Spacer()
                }
                ToolbarItem(placement: .principal) {
                    Text(component.name)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
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
            .sheet(isPresented: $isPresented) {
                SFSafariView(url: URL(string: component.documentationURL)!)
            }
            .sheet(isPresented: $showingCode) {
                NavigationStack {
                    List {
                        HStack {
                            Text(component.exampleCode)
                                .font(.subheadline)
                                .frame(maxWidth: 250, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            Button(action: {
                                copyToClipboard(component.exampleCode)
                                toggleTextColor()
                                updateCopyButtonText()
                            }) {
                                Text(copyButtonText)
                                    .foregroundColor(textColor)
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
                                showingCode.toggle()
                            }) {
                                Label("Close", systemImage: "xmark")
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Copy code function
    private func copyToClipboard(_ text: String) {
        UIPasteboard.general.string = text
    }

    // Toggle color text after being tapped
    private func toggleTextColor() {
        textColor = (textColor == .accentColor) ? .red : .accentColor
    }

    // Change button text to "Copied"
    private func updateCopyButtonText() {
        copyButtonText = "Copied"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            copyButtonText = "Copy"
            toggleTextColor()
        }
    }
}

// Preview struct (if needed)
struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleComponent = Component(id: UUID(), name: "Sample Component", iconName: "home", category: "controls", documentationURL: "https://example.com/docs", exampleCode: "let x = 10")
        MenuDetailView(component: sampleComponent)
            .previewDisplayName("Menu Detail Page Preview")
    }
}

