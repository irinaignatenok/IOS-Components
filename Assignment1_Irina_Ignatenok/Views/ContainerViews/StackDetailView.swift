import SwiftUI
import SafariServices


enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}
struct StackDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State private var isPresented = false
    @State private var showingCode = false
    @State private var selectedFlavor: Flavor = .chocolate
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ButtonWithLabel(label: "Stack") {
                        showingCode.toggle()
                    }
                    // Other list items can go here
                }
                .navigationTitle("")
                .toolbar {
                    CustomToolbar(title: component.name, isPresented: $isPresented)
                }
                
                Spacer() // This will push the Picker to the bottom of the screen
                
                // Place the Picker at the bottom of the screen
                Picker("Flavor", selection: $selectedFlavor) {
                    ForEach(Flavor.allCases) { flavor in
                        Text(flavor.rawValue.capitalized)
                    }
                }
                .pickerStyle(.palette)
                .padding()
            }
            .sheet(isPresented: $isPresented) {
                SFSafariView(url: URL(string: component.documentationURL)!)
            }
            .sheet(isPresented: $showingCode) {
                CodeSheet(isPresented: $showingCode, component: component, viewModel: viewModel)
            }
        }
    }
}
#Preview {
    StackDetailView(component: Component(name: "Example Component", iconName: "star", category: "Category", documentationURL: "https://example.com"),
                    viewModel: ComponentListViewModel())
}
