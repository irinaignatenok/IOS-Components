import SwiftUI

struct ListDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State private var showingCode = false
    @State private var isPresented = false

    var body: some View {
        NavigationStack {
            List {
                Section("Plain List") {
                    ButtonWithLabel(label: "Plain List") {
                        showingCode.toggle()
                    }
                    List {
                        Text("Item 1")
                        Text("Item 2")
                        Text("Item 3")
                    }
                    .listStyle(PlainListStyle())
                    .frame(height: 130)
                }

                Section("Inset List") {
                    HStack {
                        Text("Inset List")
                            .font(.headline)
                    }
                    List {
                        Text("Item 1")
                        Text("Item 2")
                        Text("Item 3")
                    }
                    .listStyle(InsetListStyle())
                    .frame(height: 130)
                }

                Section("Grouped List") {
                    List {
                        Section(header: Text("Section 1")) {
                            Text("Item 1")
                            Text("Item 2")
                        }
                        Section(header: Text("Section 2")) {
                            Text("Item 3")
                            Text("Item 4")
                        }
                    }
                    .listStyle(GroupedListStyle())
                    .frame(height: 260)
                }

                Section("Inset Grouped List") {
                    List {
                        Section(header: Text("Section 1")) {
                            Text("Item 1")
                            Text("Item 2")
                        }
                        Section(header: Text("Section 2")) {
                            Text("Item 3")
                            Text("Item 4")
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                    .frame(height: 280)
                }

                // Sidebar section
                Section("Sidebar List") {
                    NavigationLink(destination: StackDetailView(component: component, viewModel: viewModel)) {
                        Label("Stack", systemImage: "house")
                    }
                    NavigationLink(destination: FormDetailView(component: component, viewModel: viewModel)) {
                        Label("Form", systemImage: "gear")
                    }
                    NavigationLink(destination: AlertDetailView(component: component, viewModel: viewModel)) {
                        Label("Alert", systemImage: "person")
                    }
                }
            }
            .navigationTitle("Detail View")
            .toolbar {
                CustomToolbar(title: component.name, isPresented: $isPresented)
            }
            .sheet(isPresented: $showingCode) {
                CodeSheet(isPresented: $showingCode, component: component, viewModel: viewModel)
            }
            .sheet(isPresented: $isPresented) {
                SFSafariView(url: URL(string: component.documentationURL)!)
            }
        }
    }
}

#Preview {
    ListDetailView(component: Component(name: "", iconName: "", category: ""), viewModel: ComponentListViewModel())
}
