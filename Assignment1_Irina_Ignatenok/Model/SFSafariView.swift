//
//  SFSafariView.swift
//  Assignment1_Irina_Ignatenok
//
//  Created by Irina Ignatenok on 2024-11-07.
import SwiftUI
import SafariServices

struct SFSafariView: UIViewControllerRepresentable {
   
    var url: URL
//    @Binding var searchURL: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let configuration = SFSafariViewController.Configuration()
        configuration.barCollapsingEnabled = true
        let sfSafariViewController = SFSafariViewController(url: url, configuration: configuration)
        sfSafariViewController.dismissButtonStyle = .close
        return sfSafariViewController
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
