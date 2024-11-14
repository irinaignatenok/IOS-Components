//
//  ListModelStore.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-01.
//

import Foundation
import Observation
import SwiftUI

@Observable
final class ListModelStore {
    var items: [Component]
    
    init(lists: [Component]) {
        self.items = lists
    }
}

extension ListModelStore {
    static var mockData: ListModelStore  {
        let items = [
            Component(name: "Text", iconName: "textformat", category: "Text Input/Output", documentationURL: "https://developer.apple.com/documentation/swiftui/text", exampleCode: "Text(\"Hello, Worldccccc!\")"),
            Component(name: "Image", iconName: "photo", category: "Text Input/Output", documentationURL: "https://developer.apple.com/documentation/swiftui/image", exampleCode:
                        """
                        Image("Mojave Day")
                            .resizable()
                            .aspectRatio(2.0, contentMode: .fill)
                        """),
            
            
            Component(name: "Button", iconName: "button.horizontal", category: "Controls", documentationURL: "https://developer.apple.com/documentation/swiftui/button", exampleCode:
                        """
                      Button(action:{//code})
                      {Text('Bordered')
                      .buttonStyle(.bordered)
                      .controlSize(.regular)}
                      """),
            Component(name: "Value Inputs", iconName: "button.horizontal", category: "Controls", documentationURL: "https://developer.apple.com/documentation/swiftui/slider", exampleCode:
                        """
                             Stepper(value: $count, in: 0...5)
                                 .padding()
                     """),
            Component(name: "Menu", iconName: "ellipsis.circle", category: "Controls", documentationURL: "https://developer.apple.com/documentation/swiftui/menu", exampleCode:
                        """
                        Menu("Show Menu with Control Group") {
                            ControlGroup {
                                Button(action: {
                                    // Code for pin action
                                }) {
                                    Image(systemName: "pin.fill")
                                }
                                
                                Button(action: {
                                    // Code for lock action
                                }) {
                                    Image(systemName: "lock")
                                }
                                
                                Button(action: {
                                    // Code for magnifying glass action
                                }) {
                                    Image(systemName: "magnifyingglass")
                                }
                            }
                            
                            Section {
                                Button(action: {
                                    // Code for Move File action
                                }) {
                                    Label("Move File", systemImage: "folder")
                                }
                                
                                Button(action: {
                                    // Code for New Folder action
                                }) {
                                    Label("New Folder", systemImage: "folder.badge.plus")
                                }
                            }
                        }
"""),
            Component(name: "Picker", iconName: "calendar", category: "Controls", documentationURL: "https://developer.apple.com/documentation/swiftui/picker", exampleCode:
                        """
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(Flavor.allCases) { flavor in
                            Text(flavor.rawValue.capitalized)
                        }
                    }
"""),
            Component(name: "Progress View", iconName: "clock", category: "Controls", documentationURL: "https://developer.apple.com/documentation/swiftui/progressVIew", exampleCode:
                        """
                        VStack {
                            ProgressView(value: progress)
                            Button("More") { progress += 0.05 }
                        }
"""),
            Component(name: "Stack", iconName: "square.stack.3d.up", category: "Container Views", documentationURL: "https://developer.apple.com/documentation/swiftui/vstack", exampleCode:
                        """
                       var body: some View {
                           HStack(
                               alignment: .top,
                               spacing: 10
                           ) {
                               ForEach(
                                   1...5,
                               ) {
                                   Text("Item")
                               }
                           }
                       }
"""),
            Component(name: "Form", iconName: "pencil", category: "Container Views", documentationURL: "https://developer.apple.com/documentation/swiftui/form", exampleCode:
                        """
                           Form {
                                  Section(header: Text("Notifications")) {
                                      Picker("Notify Me About", selection: $notifyMeAbout) {
                                          Text("Direct Messages").tag(NotifyMeAboutType.directMessages)
                                          Text("Mentions").tag(NotifyMeAboutType.mentions)
                                          Text("Anything").tag(NotifyMeAboutType.anything)
                                      }
                                      Toggle("Play notification sounds", isOn: $playNotificationSounds)
                                      Toggle("Send read receipts", isOn: $sendReadReceipts)
                                  }
}
"""),
            Component(name: "Navigation Link", iconName: "square.stack.3d.down.right", category: "Container Views", documentationURL: "https://developer.apple.com/documentation/swiftui/NavigationStack", exampleCode:
                        """
                                 NavigationStack {
                                     List(colleges) { college in
                                         NavigationLink(college.name, value: college)
                                     }
                                     .navigationDestination(for: College.self) { college in
                                         CollegeDetails(college: college)
                                     }
                                     .navigationTitle("Colleges")
                                 }
"""),
            Component(name: "Alert", iconName: "note.text", category: "Container Views", documentationURL: "https://developer.apple.com/design/human-interface-guidelines/alerts", exampleCode:
                        """
                                       .alert("Alert Title", isPresented: $isPresented) {
                                           Button("Cancel", role: .cancel) {
                                               isPresented = false
                                           }
"""),
            Component(name: "Sheets", iconName: "square.stack", category: "Container Views", documentationURL: "https://developer.apple.com/design/human-interface-guidelines/sheets", exampleCode:
                        """
                                               .sheet(isPresented: $isPresented, content: {
                                                   VStack {
                                                       Text("Sheet is Presented")
                   .font(.title)
}}
"""),
            Component(name: "Lists View", iconName: "list.bullet", category: "List", documentationURL: "https://developer.apple.com/documentation/swiftui/list", exampleCode:
                        """
 
                      List {
                      Text("A List Item")
                      Text("A Second List Item")
                      Text("A Third List Item")
                  }
"""),
            
        ]
        return ListModelStore(lists: items)
    }
    
}

