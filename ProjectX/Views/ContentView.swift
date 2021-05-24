//
//  ContentView.swift
//  ProjectX
//
//  Created by Taha Çekin on 21.05.2021.
//

import SwiftUI

struct ContentView: View {
  @State var testing = Response(articles: [ Result(title: "", description: "", url: URL(string: "apple.com")) ])
  
  var body: some View {

    NavigationView {
    ScrollView {
      ForEach(testing.articles, id: \.self) { item in

        VStack(alignment: .leading) {
          Link(item.title, destination: item.url!)
            .font(.title)


          Text(item.description)
            .font(.subheadline)
        }.frame(width: 350, height: 100, alignment: .center)
      }
      .onAppear {
        API(yourURL: "https://newsapi.org/v2/everything?q=apple&from=2021-05-23&to=2021-05-23&sortBy=popularity&apiKey=aa380f833fc54f3e832f7074ba292130").loadData { (tt) in
          self.testing = tt
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
