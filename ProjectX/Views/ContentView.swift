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
  
  var body: some View {

    NavigationView {
      ScrollView {
        ForEach(post.news.articles, id: \.self) { item in

          ZStack {

            Image(uiImage: "\(String(describing: item.urlToImage))".loadimage())
              .resizable()
              .scaledToFit()
              .padding()

            VStack(alignment: .leading) {
              Text(item.title)
                .foregroundColor(.black)
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
          }

          }
        .onAppear {
          API(yourURL: "https://newsapi.org/v2/everything?q=apple&from=\(currentdate)&to=\(currentdate)&sortBy=popularity&apiKey=aa380f833fc54f3e832f7074ba292130").loadData { (news) in
            self.post.news = news
          }
        }
      }.navigationTitle("News")
    }
  }

}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
