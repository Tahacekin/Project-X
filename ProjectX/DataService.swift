//
//  DataService.swift
//  ProjectX
//
//  Created by Taha Çekin on 21.05.2021.
//

import Foundation

//MARK: Try The DesingCode API way but for the models make them optional for example var name: String?

class API: ObservableObject {
@Published var apiPost = [Post]()

  func load(completion: @escaping (Post) -> ()) {
    guard let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2021-05-20&to=2021-05-20&sortBy=popularity&apiKey=aa380f833fc54f3e832f7074ba292130") else { return }

    URLSession.shared.dataTask(with: url) { data, response, error in
      let decode = try! JSONDecoder().decode(Post.self, from: data!)

      DispatchQueue.main.async {
        completion(decode)
      }
    }.resume()


  }


  }


