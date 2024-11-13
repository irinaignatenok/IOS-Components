//
//  ComponentListViewModel.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-05.
//

import SwiftUI
import Observation

@Observable
final class ComponentListViewModel{
    // Observable properties
    var store: ListModelStore
    var navTitle: String = ""
    var searchTerm: String = ""
    var searchResults: [Component] = []
    
    // Properties for clipboard functionality
    var textColor: Color = .accentColor
        var copyButtonText: String = "Copy"
    
    //    Computed Properties
    var listData:[Component] {
        return searchResults.isEmpty ? store.items : searchResults
    }
    
    init(store: ListModelStore = ListModelStore.mockData, navTitle: String = "Components") {
        self.store = store
        self.navTitle = navTitle
    }
    
    // Copy code function
        func copyToClipboard(_ text: String) {
            UIPasteboard.general.string = text
            updateCopyButtonText()
        }

        // Toggle color text after being tapped
        func toggleTextColor() {
            textColor = (textColor == .accentColor) ? .red : .accentColor
        }

        // Change button text to "Copied"
        func updateCopyButtonText() {
            copyButtonText = "Copied"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.copyButtonText = "Copy"
                self.toggleTextColor()
            }
        }
}
