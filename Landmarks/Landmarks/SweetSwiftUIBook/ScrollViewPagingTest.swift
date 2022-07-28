//
//  ScrollViewPagingTest.swift
//  Landmarks
//
//  Created by sokol on 2022/06/21.
//

import SwiftUI

struct ScrollViewPagingTest: View {
    
    let colors: [Color] = [.red, .green, .yellow]
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(colors.indices) { index in
                        Circle()
                            .fill(colors[index])
                            .overlay {
                                Text("\(index) page")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height)
                }
            }
            .onAppear{ UIScrollView.appearance().isPagingEnabled = true}
            .onDisappear {
                UIScrollView.appearance().isPagingEnabled = false
            }
        }
    }
}

struct ScrollViewPagingTest_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewPagingTest()
    }
}
