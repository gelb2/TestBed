//
//  idealSizeTest.swift
//  Landmarks
//
//  Created by sokol on 2022/06/05.
//

import Foundation
import SwiftUI

struct IdealSizeTest: View {
    var body: some View {
        VStack {
            Text("Frame modifier")
                .font(.title)
                .bold()
                .fixedSize()
                .frame(width: 80, height: 30)
            Rectangle()
                .fixedSize()
            Color.red
                .fixedSize()
            Image("SwiftUI").resizable()
                .fixedSize()
            
            Rectangle()
                .frame(idealWidth: 100) //idealWidth 변경
                .fixedSize()//idealWidth는 변경하고 idealHeight는 기본값 반영
            
            Rectangle()
                .fixedSize(horizontal: true, vertical: false) //가로엔 fixedSize 적용
                .foregroundColor(.yellow)
            
            Rectangle()
                .fixedSize() //가로 세로 모두 fixedSize 적용
                .foregroundColor(.red)
        }
    }
}

struct IdealSizeTest_Preview: PreviewProvider {
    static var previews: some View {
        IdealSizeTest()
    }
}
