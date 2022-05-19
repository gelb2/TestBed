//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by pablo.jee on 2022/05/20.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
        
    }
}

struct RotatedText: View {
    var body: some View {
        Text("Rotation by passing an angle in degrees")
            .rotationEffect(.degrees(45), anchor: .center)
            .border(Color.gray)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RotatedBadgeSymbol(angle: Angle(degrees: 5))
            RotatedText()
        }
    }
}
