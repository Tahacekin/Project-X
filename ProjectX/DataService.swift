//
//  DataService.swift
//  ProjectX
//
//  Created by Taha Çekin on 21.05.2021.
//

import Foundation

//MARK: Try The DesingCode API way but for the models make them optional for example var name: String?

class API {

  func loadData(complition: @escaping (Response) -> ()) {

    guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=aa380f833fc54f3e832f7074ba292130")
    else { return }

    let request = URLRequest(url: url)

    URLSession.shared.dataTask(with: request) { data, response, error in
      if let data = data {
        if let decodedData = try? JSONDecoder().decode(Response.self, from: data) {
          DispatchQueue.main.async {
            complition(decodedData)
          }
          return
        }

      }
      print("Fetch Failed \(error?.localizedDescription ?? "Unkwon Error")")

    }.resume()
  }
}


