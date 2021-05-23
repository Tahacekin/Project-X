//
//  ContentView.swift
//  ProjectX
//
//  Created by Taha Çekin on 21.05.2021.
//

import SwiftUI

struct ContentView: View {
  @State var testing = Response(articles: [ Result(title: "", description: "", url: nil) ])
  
  var body: some View {

    ScrollView {
      ForEach(testing.articles, id: \.self) { item in

        VStack(alignment: .leading) {
          Text(item.title)
            .font(.title)
            .fontWeight(.bold)

          Text(item.description)
            .font(.subheadline)
            .fontWeight(.semibold)
        }.frame(width: 350, height: 100, alignment: .center)


      }
      .onAppear {
        API().loadData { (tt) in
          self.testing = tt
        }
      }
    }

  }

}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
