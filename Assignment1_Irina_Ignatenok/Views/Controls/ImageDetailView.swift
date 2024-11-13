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
                ButtonWithLabel(label: "Image") {
                    showingCode.toggle()
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
                CustomToolbar(title: component.name, isPresented: $isPresented)
            }
//            This sheet presents the code for the image
            .sheet(isPresented: $showingCode) {
           CodeSheet(isPresented: $showingCode, component: component, viewModel: viewModel)
            }
//            Sheet presents the documentation
            .sheet(isPresented: $isPresented) {
                SFSafariView(url: URL(string: component.documentationURL)!)
            }
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
