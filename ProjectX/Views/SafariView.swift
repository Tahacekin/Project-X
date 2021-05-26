//
//  SafariViewController.swift
//  ProjectX
//
//  Created by Taha Çekin on 26.05.2021.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {

  typealias UIViewControllerType = SFSafariViewController

  let url: URL

  func makeUIViewController(context: Context) -> SFSafariViewController {
    let vc = SFSafariViewController(url: url)
    return vc
  }

  func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    
  }


}

struct SafariView_Previews: PreviewProvider {
  static var previews: some View {
    SafariView(url: URL(string: "")!)
  }
}
