//
//  InputDetailView.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-12.
//

import SwiftUI

struct InputsDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State var volume: Double = 50.0
    @State var rating: Double = 5.0
    @State private var showingCode: Bool = false
    @State private var isShown: Bool = false
    @State private var isPresented: Bool = false
    @State private var isShownLink: Bool = false
    @State private var isShownToggle: Bool = false
    @State private var toggleState: Bool = false
    
    @State var count: Int = 0

       var body: some View {
           NavigationStack{
               List{
                   ButtonWithLabel(label: "Inputs") {
                       showingCode.toggle()
                   }
                   HeaderView(title: "Slider View", isShown: $isShown)
                   Section("Continuous Slider"){
                       Text("Slider Value: \(volume)")
                       
                       Slider(value: $volume, in: 0...100) {
                           Text("Volume")
                       } minimumValueLabel: {
                           Image(systemName: "speaker")
                       } maximumValueLabel: {
                           Image(systemName: "speaker.wave.3")
                       }
                       .padding()
                   }
                   Section("Stepped Slider"){
                       Text("Slider Value: \(rating)")
                       
                       Slider(value: $rating, in: 0...10, step: 1) {
                           Text("Rating")
                       } minimumValueLabel: {
                           Text("0")
                       } maximumValueLabel: {
                           Text("10")
                       }
                       .padding()
                   }
                   HeaderView(title: "Stepper", isShown: $isShownLink)
                   HStack{
                       Stepper(" \(count)", value: $count, in: 0...5)
                           
                   }.padding()
                   
                   HeaderView(title: "Toggle", isShown: $isShownToggle)
                   HStack{
                       Toggle("Switch", isOn: $toggleState)
                           .padding()
                   }
               }
           }
           .navigationTitle("") 
                    .toolbar {
                        
                        CustomToolbar(title: component.name, isPresented: $isPresented)
                    }
                    .sheet(isPresented: $isPresented) {
                        SFSafariView(url:URL(string:
                                        component.documentationURL)!)
                    }
                    .sheet(isPresented: $isShownLink) {
                        SFSafariView(url:URL(string:
                                        "https://developer.apple.com/documentation/swiftui/stepper")!)
                    }
                    .sheet(isPresented: $isShown) {
                        SFSafariView(url:URL(string:
                                        "https://developer.apple.com/documentation/swiftui/slider")!)
                    }
                    .sheet(isPresented: $isShownToggle) {
                        SFSafariView(url:URL(string:
                                        "https://developer.apple.com/documentation/swiftui/toggle")!)
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


struct InputDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mockComponent = Component(
            name: "Text",
            iconName: "textformat",
            category: "Text Input/Output",
            documentationURL: "https://developer.apple.com/documentation/swiftui/text",
            exampleCode: "Text(\"Hello, World!\")"
        )
        
        let viewModel = ComponentListViewModel()
        
        InputsDetailView(component: mockComponent, viewModel: viewModel)
    }
}
