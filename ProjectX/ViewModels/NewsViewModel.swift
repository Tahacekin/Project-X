//
//  TeslaNewsView.swift
//  ProjectX
//
//  Created by Taha Çekin on 24.05.2021.
//

import Foundation

class NewsViewModel: ObservableObject {
  @Published var news = Response(articles: [ Result(title: "", description: "", url: URL(string: "apple.com"), urlToImage: URL(string: "apple.com")!) ])
  var selectedArticle: Result?
}
