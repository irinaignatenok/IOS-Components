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
    
    //    Computed Properties
    var listData:[Component] {
        return searchResults.isEmpty ? store.items : searchResults
    }
    
    init(store: ListModelStore = ListModelStore.mockData, navTitle: String = "Components") {
        self.store = store
        self.navTitle = navTitle
    }
    
}
