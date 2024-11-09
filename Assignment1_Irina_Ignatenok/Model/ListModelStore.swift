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
            Component(name: "Value Inputs", iconName: "button.horizontal", category: "Controls", documentationURL: "https://developer.apple.com/documentation/swiftui/button", exampleCode: "Button(\"Press Me\") {}"),
            Component(name: "Menu", iconName: "ellipsis.circle", category: "Controls", documentationURL: "https://developer.apple.com/documentation/swiftui/menu", exampleCode: "Menu { /* actions */ } label: { Text(\"Options\") }"),
        
        ]
        return ListModelStore(lists: items)
    }
        
}
