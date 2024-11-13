//
//  ProgressViewDetailView.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-12.
//

import SwiftUI

struct ProgressViewDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    @State private var showingCode = false
    @State private var isShown = false
    @State private var isPresented = false
    
    @State private var progress = 0.5
    var body: some View {
        NavigationStack{
            List{
                ButtonWithLabel(label: "Progress View") {
                    showingCode.toggle()
                    
                }
                VStack(spacing: 30) {
                    ProgressView()
                    LinearProgressDemoView()
                    DateRelativeProgressDemoView()
                }
                .padding()
                
            }
        }  .navigationTitle("")
            .toolbar {
                
                CustomToolbar(title: component.name, isPresented: $isPresented)
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

struct ProgressViewDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mockComponent = Component(
            name: "Text",
            iconName: "textformat",
            category: "Text Input/Output",
            documentationURL: "https://developer.apple.com/documentation/swiftui/text",
            exampleCode: "Text(\"Hello, World!\")"
        )
        
        let viewModel = ComponentListViewModel()
        
        ProgressViewDetailView(component: mockComponent, viewModel: viewModel)
    }
}
struct LinearProgressDemoView: View {
    @State private var progress = 0.5

    var body: some View {
        VStack {
            ProgressView(value: progress)
            Button("More") { progress += 0.05 }
        }
    }
}

struct DateRelativeProgressDemoView: View {
    let workoutDateRange = Date()...Date().addingTimeInterval(5*60)

    var body: some View {
         ProgressView(timerInterval: workoutDateRange) {
             Text("Workout")
         }
         .tint(.green)
    }
}
