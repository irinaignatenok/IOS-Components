import SwiftUI
import SafariServices

// Rename to avoid conflicts
enum IceCreamFlavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

struct PickerDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State private var date = Date()
    
    // Define the date range safely
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let start = calendar.date(from: DateComponents(year: 2024, month: 11, day: 1))!
        let end = calendar.date(from: DateComponents(year: 2024, month: 11, day: 30, hour: 23, minute: 59, second: 59))!
        return start...end
    }()
    
    @State private var bgColor = Color(red: 0.98, green: 0.9, blue: 0.2)
    @State private var selectedFlavor: IceCreamFlavor = .chocolate
    @State private var showingCode = false
    @State private var isShown = false
    @State private var isPresented = false
    @State private var isDocumentation = false
    
    var body: some View {
        NavigationStack {
            List {
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
                
                Section("Default Picker") {
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(IceCreamFlavor.allCases) { flavor in
                            Text(flavor.rawValue.capitalized)
                        }
                    }
                }
                
                Section("Wheel Picker") {
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(IceCreamFlavor.allCases) { flavor in
                            Text(flavor.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                
                Section("Segmented Picker") {
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(IceCreamFlavor.allCases) { flavor in
                            Text(flavor.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
                
                HeaderView(title: "Date Picker", isShown: $isShown)
                Section("Date Picker") {
                    DatePicker("Date Picker", selection: $date, displayedComponents: [.date])
                        .padding()
                }
                
                Section("Ranged Date Picker") {
                    DatePicker("Date", selection: $date, in: dateRange, displayedComponents: [.date, .hourAndMinute])
                        .padding()
                }
                
                Section("Wheel Date Picker") {
                    DatePicker("Wheel", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(WheelDatePickerStyle())
                        .padding()
                }
                
                HeaderView(title: "Color Picker", isShown: $isDocumentation)
                ColorPicker("Color", selection: $bgColor)
                    .padding()
            }
            .navigationTitle(component.name)
            .toolbar {
                CustomToolbar(title: component.name, isPresented: $isPresented)
            }
            .sheet(isPresented: $isPresented) {
                if let url = URL(string: component.documentationURL) {
                    SFSafariView(url: url)
                }
            }
            .sheet(isPresented: $isShown) {
                if let url = URL(string: "https://developer.apple.com/documentation/swiftui/datepicker") {
                    SFSafariView(url: url)
                }
            }
            .sheet(isPresented: $isDocumentation) {
                if let url = URL(string: "https://developer.apple.com/documentation/swiftui/colorpicker") {
                    SFSafariView(url: url)
                }
            }
            .sheet(isPresented: $showingCode) {
                CodeSheet(isPresented: $showingCode, component: component, viewModel: viewModel)
            }
        }
    }
}

struct PickerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mockComponent = Component(
            name: "Picker",
            iconName: "chevron.right",
            category: "Pickers",
            documentationURL: "https://developer.apple.com/documentation/swiftui/picker",
            exampleCode: "Picker(\"Select a flavor\", selection: $selectedFlavor)"
        )
        
        let viewModel = ComponentListViewModel()
        
        PickerDetailView(component: mockComponent, viewModel: viewModel)
    }
}
