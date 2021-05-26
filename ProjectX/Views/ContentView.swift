//
//  ContentView.swift
//  ProjectX
//
//  Created by Taha Çekin on 21.05.2021.
//

import SwiftUI

struct ContentView: View {

  @State var post = Response(articles: [ Result(title: "", description: "", url: URL(string: "apple.com")) ])
  @State private var showSafari = false
  @State var viewModel = ViewModel()
  
  var body: some View {

    NavigationView {
      ScrollView {
        ForEach(post.articles, id: \.self) { item in

          VStack(alignment: .leading) {
            Text(item.title)
              .foregroundColor(.black)
              .font(.title)
              .onTapGesture {
                // Add the captured struct from memory if needed
                viewModel.selectedArticle = item
                showSafari = true
              }
              .sheet(isPresented: $showSafari) {
                if let stringURL = viewModel.selectedArticle?.url, let url = URL(string: "\(stringURL)") {
                  SafariView(url: url)
                }


              }


            Text(item.description)
              .font(.subheadline)
          }.frame(width: 350, height: 100, alignment: .center)
        }
        .onAppear {
          API(yourURL: "https://newsapi.org/v2/everything?q=apple&from=2021-05-23&to=2021-05-23&sortBy=popularity&apiKey=aa380f833fc54f3e832f7074ba292130").loadData { (tt) in
            self.post = tt
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
