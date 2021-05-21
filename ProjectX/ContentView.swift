//
//  ContentView.swift
//  ProjectX
//
//  Created by Taha Çekin on 21.05.2021.
//

import SwiftUI

struct ContentView: View {
@State var results = [Articles]()

   var body: some View {
      Text("Project X- Test still testing")
          .font(.title)
          .fontWeight(.bold)
    }

//  func load() {
//    guard let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2021-05-20&to=2021-05-20&sortBy=popularity&apiKey=aa380f833fc54f3e832f7074ba292130") else {
//      print("Invalid URL")
//      return
//    }
//
//    let request = URLRequest(url: url)
//
//    URLSession.shared.dataTask(with: request) { data, response, error in
//      if let data = data {
//        if let let decodedData = try? JSONDecoder().decode(Response.self, from: data) {
//          DispatchQueue.main.async {
//            self.results = decodedData
//          }
//          return
//        }
//      }
//    }
//  }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
