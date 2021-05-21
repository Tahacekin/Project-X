//
//  ArticleModel.swift
//  ProjectX
//
//  Created by Taha Çekin on 21.05.2021.
//

import Foundation

struct Post: Codable {
  var articles: Articles
}

struct Articles: Codable {
  var source: Source
  var title: String?
  var description: String?
  var url: URL?
}

struct Source: Codable, Identifiable {
  var id: String?
  var name: String?
}

