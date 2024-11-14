//
//  SafariView.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-14.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    var url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}
