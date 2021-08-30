//
//  ContentView.swift
//  AnimatedIndecator
//
//  Created by 张亚飞 on 2021/8/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //getting screensize globally
        
        GeometryReader {proxy in
            
            let size = proxy.size
            
            Home(screenSize: size)
                .preferredColorScheme(.dark)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
