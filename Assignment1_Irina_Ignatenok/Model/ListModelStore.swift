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
            Component(name: "Label", iconName: "note.text", category: "Text Input/Output", documentationURL: "https://developer.apple.com/documentation/swiftui/label", exampleCode: "Text(\"Hello, Worldvvv!\")"),
            Component(name: "TextField", iconName: "text.bubble", category: "Text Input/Output", documentationURL: "https://developer.apple.com/documentation/swiftui/textfield", exampleCode: "Text(\"Hello, Worldbbb!\")"),
            Component(name: "TextArea", iconName: "text.quote", category: "Text Input/Output", documentationURL: "https://developer.apple.com/documentation/swiftui/textfield", exampleCode: "Text(\"Hello, Worldnnn!\")"),
            Component(name: "SecureField", iconName: "ellipsis.rectangle", category: "Text Input/Output", documentationURL: "https://developer.apple.com/documentation/swiftui/SecureField", exampleCode: "Text(\"Hello, Worldmmm!\")"),
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
                       
"""),
        
        ]
        return ListModelStore(lists: items)
    }
        
}
