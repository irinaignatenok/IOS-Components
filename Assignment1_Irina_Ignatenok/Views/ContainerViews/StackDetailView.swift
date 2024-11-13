import SwiftUI
import SafariServices

enum StackView: String, CaseIterable, Identifiable {
    case hstack, vstack, zstack
    var id: Self { self }
}

struct StackDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State private var isPresented = false
    @State private var showingCode = false
    @State private var showHstack = false
    @State private var showVstack = false
    @State private var showZstack = false
    @State private var selectedView: StackView = .hstack
   
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ButtonWithLabel(label: "Stack") {
                        showingCode.toggle()
                    }
                    switch selectedView {
                    case .hstack:
                        HStack{
                            HeaderView(title: "HStack", isShown: $showHstack)
                        }
                        .foregroundStyle(.blue)
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(0..<15) { _ in
                                        RepeatedItems()
                                    }
                                }
                                .padding()
                            }
                        
                    case .vstack:
                        HStack{
                            HeaderView(title: "VStack", isShown: $showVstack)
                        }
                        .foregroundStyle(.blue)
                        ScrollView {
                            VStack {
                                ForEach(0..<10) { _ in
                                    RepeatedItems()
                                }
                            }
                            .padding()
                        }
                    case .zstack:
                        HStack{
                            HeaderView(title: "ZStack", isShown: $showZstack)
                        }
                        .foregroundStyle(.blue)
                        ZStack {
                            ForEach(0..<10) { index in
                                     RepeatedItems()
                                    .padding(10)
                                    .offset(x: CGFloat(index * 5), y: CGFloat(index * 5))
                            }
                                }
                            .padding()
                        }
                }
                .navigationTitle("")
                .toolbar {
                    CustomToolbar(title: component.name, isPresented: $isPresented)
                }

                }
    
                Picker("Select Stack", selection: $selectedView) {
                    ForEach(StackView.allCases) { flavor in
                        Text(flavor.rawValue.capitalized)
                    }
                }
                .pickerStyle(.palette)
                .padding()
            }
            Spacer()
            .sheet(isPresented: $isPresented) {
                SFSafariView(url: URL(string: component.documentationURL)!)
            }
            .sheet(isPresented: $showingCode) {
                CodeSheet(isPresented: $showingCode, component: component, viewModel: viewModel)
            }
            .sheet(isPresented: $showVstack) {
                SFSafariView(url:URL(string:
                                "https://developer.apple.com/documentation/swiftui/vstack")!)
            }
            .sheet(isPresented: $showHstack) {
                SFSafariView(url:URL(string:
                                "https://developer.apple.com/documentation/swiftui/hstack")!)
            }
            .sheet(isPresented: $showZstack) {
                SFSafariView(url:URL(string:
                                "https://developer.apple.com/documentation/swiftui/zstack")!)
            }
        }
    }


struct RepeatedItems: View {
    var body: some View {
        Text("This is stack page")
            .padding()
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

#Preview {
    StackDetailView(component: Component(name: "Example Component", iconName: "star", category: "Category", documentationURL: "https://example.com"),
                    viewModel: ComponentListViewModel())
}
