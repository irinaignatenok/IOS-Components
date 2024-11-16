//
//  ContentView.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-01.
//

import SwiftUI

struct ComponentContentView: View {
    @State var viewModel: ComponentListViewModel
    
    var body: some View {
        NavigationStack {
//            List of 4 sections(components)
            List{
                
                Section("Text Input/Output") {
                    
                    RenderedItemsView(items: viewModel.store.items, category: "Text Input/Output")
                }
                Section("Controls") {
                    RenderedItemsView(items: viewModel.store.items, category: "Controls")
                }
                Section("Container Views") {
                    RenderedItemsView(items: viewModel.store.items, category: "Container Views")
                }
                Section("List") {
                    RenderedItemsView(items: viewModel.store.items, category: "List")
                }
                
            }
            .navigationTitle(viewModel.navTitle)
            .searchable(text: $viewModel.searchTerm,
                        placement:
                    .navigationBarDrawer(displayMode: .automatic), prompt: "Search for Component")
            .onChange(of: viewModel.searchTerm) {
                viewModel.filterSearchResult()
            }
            
        }
    }
}
//Render all components
struct RenderedItemsView: View {
    let items: [Component]
    let category: String
    
    var filteredItems: [Component] {
        items.filter { $0.category == category }
    }
    
    var body: some View {
        ForEach(filteredItems) { item in
            NavigationLink(destination: destinationView(for:item)){
                HStack {
                    Image(systemName: item.iconName)
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.accentColor)
                    Text(item.name)
                        .font(.subheadline)
                        .padding(.leading, 8)
                }
                
            }
        }
    }
    //    Function to determine the destination view based on the component name
    @ViewBuilder
    private func destinationView(for item: Component) -> some View {
        switch item.name {
        case "Text":
            TextDetailView(component: item, viewModel: ComponentListViewModel())
        case "Image":
            ImageDetailView(component: item, viewModel: ComponentListViewModel())
            
        case "Button":
            ButtonDetailView(component: item, viewModel: ComponentListViewModel())
        case "Menu":
            MenuDetailView(component: item, viewModel: ComponentListViewModel())
        case "Picker":
            PickerDetailView(component: item, viewModel: ComponentListViewModel())
        case "Value Inputs":
            InputsDetailView(component: item, viewModel: ComponentListViewModel())
        case "Progress View":
            ProgressViewDetailView(component: item, viewModel: ComponentListViewModel())
        case "Stack":
            StackDetailView(component: item, viewModel: ComponentListViewModel())
        case "Form":
            FormDetailView(component: item, viewModel: ComponentListViewModel())
        case "Navigation Link":
            NavigationStackDetailView(component: item)
        case "Alert":
            AlertDetailView(component: item, viewModel: ComponentListViewModel())
        case "Sheets":
            SheetDetailView(component: item, viewModel: ComponentListViewModel())
        case "Lists View":
            ListDetailView(component: item, viewModel: ComponentListViewModel())
        default:
            ComponentDetailView(component: item)
        }
    }
}

#Preview {
    ComponentContentView(viewModel: ComponentListViewModel(store: .mockData))
}
