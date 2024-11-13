import SwiftUI
import SafariServices

// College model
// College model
struct College: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

// Sample data for colleges
let colleges = [
    College(name: "Fanshawe"),
    College(name: "Seneca"),
    College(name: "Humber")
]

struct NavigationStackDetailView: View {
    let component: Component
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            List(colleges) { college in
                NavigationLink(college.name, value: college)
            }
            .navigationDestination(for: College.self) { college in
                CollegeDetails(college: college)
            }
            .navigationTitle("Colleges")
            .toolbar {
                CustomToolbar(title: component.name, isPresented: $isPresented)
            }
        }
        .sheet(isPresented: $isPresented) {
            if let url = URL(string: component.documentationURL) {
                SFSafariView(url: url)
            }
        }
    }
}

struct CollegeDetails: View {
    let college: College
    
    var body: some View {
        VStack {
            Text(college.name)
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle(college.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            print("CollegeDetails appeared for: \(college.name)")
        }
        .onDisappear {
            print("CollegeDetails dismissed for: \(college.name)")
        }
    }
}



#Preview {
    NavigationStackDetailView(component: Component(name: "", iconName: "", category: ""))
}
