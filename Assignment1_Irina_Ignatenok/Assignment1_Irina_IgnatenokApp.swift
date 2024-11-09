//
//  Assignment1_Irina_IgnatenokApp.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-01.
//

import SwiftUI

@main
struct Assignment1_Irina_IgnatenokApp: App {
    var body: some Scene {
        WindowGroup {
            ComponentContentView(viewModel: ComponentListViewModel(store: .mockData))
        }
    }
}
