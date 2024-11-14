//
//  FormDetailView.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-12.
//

import SwiftUI
import SafariServices
enum NotifyMeAboutType: String, CaseIterable, Identifiable {
    case directMessages, mentions, anything
    var id: String { self.rawValue }
}

enum ProfileImageSize: String, CaseIterable, Identifiable {
    case large, medium, small
    var id: String { self.rawValue }
}

struct FormDetailView: View {
    let component: Component
    var viewModel: ComponentListViewModel
    
    // State variables to manage form inputs
    @State private var notifyMeAbout: NotifyMeAboutType = .directMessages
    @State private var playNotificationSounds: Bool = true
    @State private var sendReadReceipts: Bool = false
    @State private var profileImageSize: ProfileImageSize = .medium
    @State private var isPresented: Bool = false
  
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Notifications")) {
                    Picker("Notify Me About", selection: $notifyMeAbout) {
                        ForEach(NotifyMeAboutType.allCases) { type in
                            Text(type.rawValue.capitalized).tag(type)
                        }
                    }
                    Toggle("Play notification sounds", isOn: $playNotificationSounds)
                    Toggle("Send read receipts", isOn: $sendReadReceipts)
                }
                
                Section(header: Text("User Profiles")) {
                    Picker("Profile Image Size", selection: $profileImageSize) {
                        ForEach(ProfileImageSize.allCases) { size in
                            Text(size.rawValue.capitalized).tag(size)
                        }
                    }
                    Button("Clear Image Cache") {
                        
                    }
                }
            }
        }
            .navigationTitle("")
      
        .toolbar {
            CustomToolbar(title: component.name, isPresented: $isPresented)
        }
            
        .sheet(isPresented: $isPresented) {
            SFSafariView(url: URL(string: component.documentationURL)!)
        }
        
      
    }
}

// Preview for SwiftUI
struct FormDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FormDetailView(component: Component(name: "Example Component", iconName: "star", category: "Category", documentationURL: "https://example.com"),
                       viewModel: ComponentListViewModel())
    }
}
#Preview {
    FormDetailView(component: Component(name: "", iconName: "", category: ""), viewModel: ComponentListViewModel())
}
