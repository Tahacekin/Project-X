//
//  ArticleModel.swift
//  ProjectX
//
//  Created by Taha Çekin on 21.05.2021.
//

import Foundation

struct Response: Codable {
  var articles: [Result]
}

struct Result: Codable, Hashable {
  var title: String
  var description: String
  var url: URL?
//  var urlToImage: URL
}

struct Source: Codable {
  var id: String?
  var name: String?
}

struct ViewModel: Codable {
  var selectedArticle: Result?
}
