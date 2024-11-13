//
//  PickerDetailView.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-11.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

struct PickerDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2024, month: 11, day: 1)
        let endComponents = DateComponents(year: 2024, month: 11, day: 30, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    @State private var bgColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var showingCode = false
@State private var isShown = false
    @State private var isPresented = false
    @State private var isDocumentation = false
    var body: some View {
        NavigationStack{
            List{
    
                HStack {
                    Text("Picker")
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
                Section("Default Picker"){
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(Flavor.allCases) { flavor in
                            Text(flavor.rawValue.capitalized)
                        }
                    }
                }
                Section("Wheel"){
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(Flavor.allCases) { flavor in
                            Text(flavor.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                Section("Segmented"){
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(Flavor.allCases) { flavor in
                            Text(flavor.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.palette)
                    .padding()
                }
                HeaderView(title: "Date Picker", isShown: $isShown)
              
                Section("Date Picker"){
                    DatePicker("Date Picker", selection: $date, displayedComponents: [.date])
                        .padding()
                }
                Section("Ranged Date Picker"){
                    DatePicker("Date", selection: $date, in: dateRange, displayedComponents: [.date, .hourAndMinute])
                        .padding()
                }
                Section("Wheel Date Picker"){
                    DatePicker("Wheel", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(WheelDatePickerStyle())
                        .padding()
                }
                HeaderView(title: "Color Picker", isShown: $isDocumentation)
                ColorPicker("Color", selection: $bgColor)
                    .padding()
            }
            .toolbar{
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
            .sheet(isPresented: $isShown) {
                SFSafariView(url: URL(string: "https://developer.apple.com/documentation/swiftui/datepicker")!)
            }
            .sheet(isPresented: $isDocumentation) {
                SFSafariView(url: URL(string: "https://developer.apple.com/documentation/swiftui/colorpicker")!)
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
                                viewModel.copyToClipboard(component.exampleCode)
                                viewModel.toggleTextColor()
                                viewModel.updateCopyButtonText()
                            }) {
                                Text(viewModel.copyButtonText)
                                    .foregroundColor(viewModel.textColor)
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
}

struct PickerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mockComponent = Component(
            name: "Text",
            iconName: "textformat",
            category: "Text Input/Output",
            documentationURL: "https://developer.apple.com/documentation/swiftui/text",
            exampleCode: "Text(\"Hello, World!\")"
        )
        
        let viewModel = ComponentListViewModel()
        
        PickerDetailView(component: mockComponent, viewModel: viewModel)
    }
}
