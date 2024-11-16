import SwiftUI

enum ButtonStyleType: String, CaseIterable, Identifiable {
    case  plain,  bordered, prominent, custom,destructive
    
    var id: Self { self }
}

struct ButtonDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State private var isPresented = false
    @State private var isShown = false
    @State private var  isShownLink = false
    
    @State private var showingCode = false
    @State private var textColor: Color = .accentColor
    @State private var copyButtonText: String = "Copy"
    @State private var selectedStyle: ButtonStyleType = .bordered
    
    var body: some View {
        NavigationStack {
            List {
                ButtonWithLabel(label: "Button") {
                    showingCode.toggle()
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
                    }else if (selectedStyle == .prominent){
                        Button("Button") {
                            print("Button pressed!")
                        }
                        .buttonStyle(.borderedProminent)
                    }else if (selectedStyle == .custom){
                        Button("Button", systemImage: "heart") {
                            
                        }
                        .buttonStyle(.borderedProminent)
                        .foregroundStyle(.black)
                        .tint(.pink)
                        .font(.headline)
                        .controlSize(.large)
                        .foregroundColor(Color.white)
                    }else {
                        Button("Button", role: .destructive) {
                            
                        }
                        .buttonStyle(.bordered)
                    }
                }
                HeaderView(title: "Link", isShown: $isShown)
                
                HStack{
                    Link("Apple.com", destination: URL(string: "https://www.apple.com")!)
                        .padding()
                }
                HeaderView(title: "Share Link", isShown: $isShownLink)
                
                HStack {
                    ShareLink(item: URL(string: "https://www.apple.com")!)
                }
                
                
            }
        }
        
        .toolbar {
            CustomToolbar(title: component.name, isPresented: $isPresented)
        }
        .sheet(isPresented: $isShown) {
            SFSafariView(url:URL(string:
                                    "https://developer.apple.com/documentation/swiftui/link")!)
        }
        .sheet(isPresented: $isShownLink) {
            SFSafariView(url:URL(string:
                                    "https://developer.apple.com/documentation/swiftui/sharelink")!)
        }
        .sheet(isPresented: $isPresented) {
            SFSafariView(url:URL(string:
                                    component.documentationURL)!)
        }
        .sheet(isPresented: $showingCode) {
            CodeSheet(isPresented: $showingCode, component: component, viewModel: viewModel)
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


