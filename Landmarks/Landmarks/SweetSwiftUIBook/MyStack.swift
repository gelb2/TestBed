//
//  MyStack.swift
//  Landmarks
//
//  Created by sokol on 2022/06/06.
//

import SwiftUI

struct MyStack<Content: View>: View {
    
    let content: Content
    init(@ViewBuilder content: () -> Content) { //뷰빌더 속성 적용
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) { // VStack 생성자 기본값 설정
            content
        }
    }
}

struct MyStack_Previews: PreviewProvider {
    static var previews: some View {
        MyStack {
            Text("Hello")
            Text("World")
            Text("you don't look so good")
        }
    }
}
