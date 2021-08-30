//
//  Intro.swift
//  AnimatedIndecator
//
//  Created by 张亚飞 on 2021/8/30.
//

import SwiftUI

//intro model and simple intro's...
struct intro: Identifiable {
    
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
    var color: Color
}

var intros : [intro] = [

    intro(image: "food2", title: "Choose your favourite menu", description: "But they are not the inconvience that our pleasure", color: Color("Blue")),
    intro(image: "food1", title: "Find the best price", description: "There is no provision to smooth the consequences are", color: Color("Yellow")),
    intro(image: "food3", title: "Your food is ready to be delivered", description: "ter than the plain of the soul to the task", color: Color("Pink")),
    
    intro(image: "food2", title: "For test", description: "ter than the plain of the soul to the task", color: Color("Pink"))
]
