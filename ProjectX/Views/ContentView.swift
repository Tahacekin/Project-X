//
//  ContentView.swift
//  ProjectX
//
//  Created by Taha Çekin on 21.05.2021.
//

import SwiftUI

struct ContentView: View {

  @StateObject var post = NewsViewModel()
  @State private var showSafari = false
  @StateObject var currentdate = CurrentDate()
  @State var searchText = ""

  var body: some View {

    NavigationView {
      ScrollView {
        ForEach(post.news.articles, id: \.self) { item in

          HStack {

            AsyncImage(url: item.urlToImage) { image in
              image.resizable()
            } placeholder: {
              Color.gray
            }.frame(width: 150, height: 100)
              .clipShape(RoundedRectangle(cornerRadius: 21))

            VStack(alignment: .leading) {
              Text(item.title)
                .font(.title)
                .onTapGesture {
                  // Add the captured struct from memory if needed
                  post.selectedArticle = item
                  showSafari = true
                }
                .sheet(isPresented: $showSafari) {
                  if let stringURL = post.selectedArticle?.url, let url = URL(string: "\(stringURL)") {
                    SafariView(url: url)
                  }
                }


              Text(item.description)
                .font(.subheadline)
            }.frame(width: 350, height: 100, alignment: .center)
          }.frame(width: 388, height: 150)

          Divider()

          }
        .onAppear {
          API(yourURL: "https://newsapi.org/v2/everything?q=apple&from=\(currentdate)&to=\(currentdate)&sortBy=popularity&apiKey=aa380f833fc54f3e832f7074ba292130").loadData { (news) in
            self.post.news = news
          }
        }
      }.navigationTitle("News")
    }
  }

  var searchResults: String? {
    if searchText.isEmpty {
      return post.selectedArticle?.title
    } else {
      return post.selectedArticle?.title
    }
  }

}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
