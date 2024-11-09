//
//  ListModel.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-01.
//

import Foundation
import SwiftUI

struct Component: Identifiable {
    let id: UUID
    let name: String
    let iconName: String
    let category: String
    let documentationURL: String
    let exampleCode: String // Added exampleCode property
    
    
    init(id: UUID = UUID(), name: String, iconName: String, category: String, documentationURL: String = "", exampleCode: String = "") {
        self.id = id
        self.name = name
        self.iconName = iconName
        self.category = category
        self.documentationURL = documentationURL
        self.exampleCode = exampleCode
    }
}
 
