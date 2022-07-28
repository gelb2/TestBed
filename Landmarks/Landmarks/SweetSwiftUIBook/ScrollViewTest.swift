//
//  ScrollViewTest.swift
//  Landmarks
//
//  Created by sokol on 2022/06/21.
//

import SwiftUI

struct ScrollViewTest: View {
    var body: some View {
        
        ScrollView {
            
            ForEach(0..<10) { _ in
                GeometryReader {
                    Rectangle()
                        .fill(self.color(from: $0))
                }
                .frame(width: 150, height: 150)
            }
            
            Color.red
            Color.green.frame(idealHeight: 30)
            Color.blue.frame(idealHeight: 200)
        }
    }
    
    func color(from proxy: GeometryProxy) -> Color {
        //글로벌 좌표를 스크롤뷰를 기준으로 변환
        let yOffset = proxy.frame(in: .global).minY - 44 //44는 스크롤뷰의 원점이 윈도우의 원점에서 safeAreaInsets.top만큼 떨어져 있으니 그만큼 값을 빼줘서 정확한 contentOffset를 구하고자 한것임.
        let color = min(1, 0.2 + Double(yOffset / 1000)) // 0.2~1 사이값
        return Color(hue: color, saturation: color, brightness: color)
    }
}

struct ScrollViewTest_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewTest()
    }
}
