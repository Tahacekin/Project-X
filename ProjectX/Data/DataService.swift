//
//  DataService.swift
//  ProjectX
//
//  Created by Taha Çekin on 21.05.2021.
//

import Foundation
import SwiftUI


class API {
  var yourURL: String

  init(yourURL: String) {
    self.yourURL = yourURL
  }

  func loadData(complition: @escaping (Response) -> ()) {

    guard let url = URL(string: yourURL)
    else { return }

    let request = URLRequest(url: url)

    URLSession.shared.dataTask(with: request) { data, response, error in
      if let data = data {
        if let decodedData = try? JSONDecoder().decode(Response.self, from: data) {
          DispatchQueue.main.async {
            complition(decodedData)
            print(decodedData)
          }
          return
        }

      }
      print("Fetch Failed \(error?.localizedDescription ?? "Unkwon Error")")

    }.resume()
  }
}

extension String {

  func loadimage() -> UIImage {

    do {

      guard let url = URL(string: self) else {
        return UIImage()
      }

      let data: Data = try Data(contentsOf: url)

      return UIImage(data: data) ?? UIImage()
    }
    catch {
      print("Couldn't load the Images")
    }


    return UIImage()
  }
}
