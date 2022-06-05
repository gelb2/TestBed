//
//  LayoutPriorityTest.swift
//  Landmarks
//
//  Created by sokol on 2022/06/05.
//

import SwiftUI

struct LayoutPriorityTest: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {//우선순위 미적용. 3개의 뷰가 동일한 크기로 할당
                Color.red
                Color.green
                Color.blue
            }.frame(height: 40)
            
            HStack {//green 뷰는 낮은 우선순위를 가짐. 크기를 따로 지정 안하면 공간을 전혀 할당받지 않음
                Color.red.layoutPriority(1)
                Color.green
                Color.blue.layoutPriority(1)
            }.frame(height: 40)
            
            HStack {//green에 minWidth를 할당해줘서 30을 가져감.
                Color.red.layoutPriority(1)
                Color.green.frame(minWidth: 30)
                Color.blue.frame(maxWidth: 50).layoutPriority(1)
            }.frame(height: 40)
            
            HStack {//rame을 고정적으로 주면 우선순위에 상관없이 그 크기를 가져감
                Color.red.frame(width: 50)
                Color.green.layoutPriority(1)
                Color.blue.frame(maxWidth: 50).layoutPriority(1)
            }.frame(height: 40)
        }
    }
}

struct LayoutPriorityTest_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPriorityTest()
    }
}
