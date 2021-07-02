//
//  NewViewTest.swift
//  ProjectX
//
//  Created by Taha Çekin on 2.07.2021.
//

import SwiftUI

struct NewViewTest: View {
  @State private var serachtext = ""
  let foods = ["Pizza", "Hamburger", "Pasta", "Turkish Pizza"]

    var body: some View {
      NavigationView {
        List {

          ForEach(searchResults, id: \.self) { food in
            NavigationLink(destination: Text(food)) {
              Text(food)
            }
          }

        }.searchable(text: $serachtext)
          .navigationTitle("SearchBar Test")
      }
    }

  var searchResults: [String] {
    if serachtext.isEmpty {
      return foods
    } else {
      return foods.filter { $0.contains(serachtext) }
    }
  }

}

struct NewViewTest_Previews: PreviewProvider {
    static var previews: some View {
        NewViewTest()
    }
}
