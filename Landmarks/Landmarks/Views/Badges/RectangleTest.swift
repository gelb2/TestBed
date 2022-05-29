//
//  RectangleTest.swift
//  Landmarks
//
//  Created by pablo.jee on 2022/05/20.
//

import SwiftUI

struct RectangleTest: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 20, y: 0))
            path.addLine(to: CGPoint(x: 20, y: 200))
            path.addLine(to: CGPoint(x: 220, y: 200))
            path.addLine(to: CGPoint(x: 220, y: 0))
            path.move(to: CGPoint(x: 20, y: 300))
            path.addLine(to: CGPoint(x: 20, y: 340))
            path.addLine(to: CGPoint(x: 260, y: 340))
            path.move(to: CGPoint(x: 20, y: 360))
            path.addLine(to: CGPoint(x: 20, y: 400))
            path.addLine(to: CGPoint(x: 300, y: 450))
        }
        .fill(
            .linearGradient(Gradient(colors: [.green, .blue]),
                            startPoint: .init(x: 0.5, y: 0),
                            endPoint: .init(x: 0.5, y: 0.5)
            )
        )
    }
}

struct RectangleTest_Previews: PreviewProvider {
    static var previews: some View {
        RectangleTest()
    }
}
