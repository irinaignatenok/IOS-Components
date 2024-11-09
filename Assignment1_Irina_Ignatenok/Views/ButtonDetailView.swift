import SwiftUI

enum ButtonStyleType: String, CaseIterable, Identifiable {
    case automatic, plain, borderless, bordered, prominent, custom
    
    var id: Self { self }
}

struct ButtonDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State private var isPresented = false
    @State private var showingCode = false
    @State private var textColor: Color = .accentColor
    @State private var copyButtonText: String = "Copy"
    @State private var selectedStyle: ButtonStyleType = .automatic

    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text("Button")
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
                
                HStack {
                    Image(systemName: "paintbrush")
                        .foregroundColor(.accentColor)
                        .frame(width: 24, height: 24)
                    
                    Picker("Style", selection: $selectedStyle) {
                        ForEach(ButtonStyleType.allCases) { style in
                            Text(style.rawValue.capitalized)
                                .tag(style)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    
                
                  
                }
                .padding()
                HStack{
                    if (selectedStyle == .plain){
                        Button("Button") {
                            print("Button pressed!")
                        }
                        .buttonStyle(.plain)
                    } else if (selectedStyle == .bordered){
                        Button("Button") {
                            print("Button pressed!")
                        }
                        .buttonStyle(.bordered)
                    }
                }
            }
        }
        
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

    // Function to return the appropriate button style
  

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

struct ButtonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mockComponent = Component(
            name: "Text",
            iconName: "textformat",
            category: "Text Input/Output",
            documentationURL: "https://developer.apple.com/documentation/swiftui/text",
            exampleCode: "Text(\"Hello, World!\")"
        )
        
        let viewModel = ComponentListViewModel()
        
        ButtonDetailView(component: mockComponent, viewModel: viewModel)
    }
}
