//
//  AnimationRange.swift
//  TST Range-2
//
//  Created by Taha Çekin on 7.05.2021.
//

import SwiftUI

struct OpeningScreen: View {
    @State var animate = false
    @State var showAnimation = true
    @State var rotation = false
    
    var body: some View {
        
        ZStack {
            //MARK: -Normal View
            ContentView()
            //MARK: -Animation
            ZStack {
                Color(.black)
                
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 200)
                    .foregroundColor(.white)
                    .rotationEffect(.init(degrees: rotation ? 180 : 0))
                    .scaleEffect(animate ? 200 : 1)
                    .animation(.easeIn(duration: 1.0))
                
            }.edgesIgnoringSafeArea(.all)
            .animation(.default)
            .opacity(showAnimation ? 1 : 0)
           
        } .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
              rotation.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                animate.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.75) {
                showAnimation.toggle()
            }
        }
    }
}

struct OpeningScreen_Previews: PreviewProvider {
    static var previews: some View {
      OpeningScreen()
    }
}
