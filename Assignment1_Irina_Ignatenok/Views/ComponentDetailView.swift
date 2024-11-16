//
//  ComponentDetailView.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-07.
//

import SwiftUI
import SafariServices

struct ComponentDetailView: View {
    let component: Component
    @State private var showingDocumentation = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(component.name)
                    .font(.largeTitle)
                    .padding()
                
                Text(component.category)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Documentation:")
                    .font(.headline)
                
                Button("View Documentation") {
                    showingDocumentation = true
                    
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $showingDocumentation) {
                    SafariView(url: URL(string: component.documentationURL)!)
                }
                
                Text("Example Code:")
                    .font(.headline)
                
                Text(component.exampleCode)
                    .font(.body)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(component.name)
    }
}

struct SafariView: UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}
//
//#Preview {
//    ComponentDetailView(component: ListModelStore(lists: Component))
//}
