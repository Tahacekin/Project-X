//
//  SafariLaunchScreen.swift
//  ProjectX
//
//  Created by Taha Çekin on 24.05.2021.
//

import Foundation

class CurrentDate: ObservableObject {
  let cal = Date()

  init() {
    _ = Calendar.current.dateComponents([.year, .month, .day], from: cal)
  }
}


