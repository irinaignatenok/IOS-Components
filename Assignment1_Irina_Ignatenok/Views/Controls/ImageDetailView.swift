import SwiftUI
import SafariServices

struct ImageDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State private var isPresented = false
    @State private var showingCode = false
    @State private var textColor: Color = .accentColor
    @State private var copyButtonText: String = "Copy"
    @State private var isToggled: Bool = false

    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text("Image")
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
                    HStack {
                        Image(systemName: "photo")
                            .foregroundColor(.accentColor)
                            .padding(.trailing, 8)
                        Toggle("Content Mode", isOn: $isToggled)
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                            
                    }
                    
                    VStack(alignment: .leading) {
                        Image("1024")
                            .resizable()
                            .aspectRatio(contentMode: isToggled ? .fit : .fill)
    //
                            .frame(height: 200)
                            .clipped()
                    }
                }
               
//            Nav Bar
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
//            This sheet presents the code for the image
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
//            Sheet presents the documentation
            .sheet(isPresented: $isPresented) {
                SFSafariView(url: URL(string: component.documentationURL)!)
            }
        }
    }

//    Copy code function
    private func copyToClipboard(_ text: String) {
        UIPasteboard.general.string = text
    }

//Toggle color text after being tapped
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

// Preview setup
struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mockComponent = Component(
            name: "Text",
            iconName: "textformat",
            category: "Text Input/Output",
            documentationURL: "https://developer.apple.com/documentation/swiftui/text",
            exampleCode: "Text(\"Hello, World!\")"
        )
        
        let viewModel = ComponentListViewModel()
        
        ImageDetailView(component: mockComponent, viewModel: viewModel)
            .previewDevice("iPhone 14") // Specify the device to preview
            .preferredColorScheme(.light) // Set to light mode for preview
    }
}
