//
//  Home.swift
//  AnimatedIndecator
//
//  Created by 张亚飞 on 2021/8/30.
//

import SwiftUI

struct Home: View {
    
    var screenSize: CGSize
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        VStack {
            
            Button {
                
            } label: {
                
                Image(systemName: "greaterthan.circle")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 35, height: 35)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            
            OffsetPageTabView(offset: $offset) {
                
                
                HStack(spacing: 0) {
                    
                    ForEach(intros) {intro in
                        
                        VStack {
                            
                            Image(intro.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: screenSize.height / 3)
                            
                            VStack(alignment: .leading, spacing: 20) {
                                
                                Text(intro.title)
                                    .font(.largeTitle.bold())
                                
                                Text(intro.description)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                            .foregroundStyle(.white)
                            .padding(.top, 50)
                            .frame(maxWidth:.infinity, alignment: .leading)
                        }
                        .padding()
                        //setting max Width
                        .frame(width: screenSize.width)
                    }
                }
 
            }
            
            //animation indicator...
            HStack(alignment: .bottom) {
                
                //indicators...
                HStack(spacing:12) {
                    
                    ForEach(intros.indices, id: \.self) { index  in
                        
                        Capsule()
                            .fill(.white)
                        //increasing width for only current index...
                            .frame(width: getIndex() == index ? 20 : 7, height: 7)
                            
                    }
                }
                .overlay(
                    
                    Capsule()
                        .fill(.white)
                        .frame(width: 20, height: 7)
                        .offset(x: getIndicatorOffset())
                    
                    ,alignment: .leading
                )
                .offset(x:10, y: -15)
                
                Spacer()
                
                Button {
                    
                    let index = min(getIndex() + 1, intros.count - 1)
                    
                    offset = CGFloat(index) * screenSize.width
                    
                } label: {
                
                    Image(systemName: "chevron.right")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(20)
                        .background(
                        
                            intros[getIndex()].color,
                            in: Circle()
                        )
                }

            }
            .padding()
            .offset(y: -20)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onChange(of: offset) { _ in
            
//            print(offset)
        }
        //animating when index changes...
        .animation(.easeInOut, value: getIndex())
    }
    
    //offset for indicator...
    func getIndicatorOffset() -> CGFloat {
        
        let progress = offset / screenSize.width
        
        //12 = spacing
        //7 = circleSize
        let maxWidth: CGFloat = 12 + 7
        
        return progress * maxWidth
    }
    
    //Expading index based on offset...
    func getIndex() -> Int {
        
        let progress = round(offset / screenSize.width)
        
        //for saftey
        let index = min(Int(progress), intros.count - 1)
        return index
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
