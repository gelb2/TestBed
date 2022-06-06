//
//  EnvironmentAttrTest.swift
//  Landmarks
//
//  Created by sokol on 2022/06/06.
//

import SwiftUI

struct EnvironmentAttrTest: View {
    
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
        if layoutDirection == .leftToRight {
            return Text("left To right")
        } else if layoutDirection == .rightToLeft {
            return Text("right to left")
        } else {
            return Text("Another Direction????")
        }
    }
}

struct EnvironmentAttrTest_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentAttrTest()
    }
}
