//
//  TransistionTest.swift
//  Landmarks
//
//  Created by sokol on 2022/07/04.
//

import SwiftUI

struct TransistionTest: View {
    
    @State private var showText = false
    
    var myTransistion: AnyTransition {
        let insertion = AnyTransition.offset(x: 300, y: -300)
            .combined(with: .scale)
        let removal = AnyTransition.move(edge: .leading)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    var body: some View {
        VStack {
            if showText {
                Text("transistion")
                    .font(.largeTitle)
                    .padding()
                    .transition(.scale)
                Text("combinedTrasistion")
                    .transition(AnyTransition.slide.combined(with: .scale))
                Text("asymmetricTransistion")
                    .transition(myTransistion)
                Text("modifier")
                    .transition(.modifier(active: CustomScaleModifier(scale: 0), identity: CustomScaleModifier(scale: 1)))
            }
            
            Button("Display Text on off") {
                withAnimation { //애니메이션
                    self.showText.toggle()
                }
            }.font(.title)
            
        }
    }
}

struct TransistionTest_Previews: PreviewProvider {
    static var previews: some View {
        TransistionTest()
    }
}

struct CustomScaleModifier: ViewModifier {
    let scale: CGFloat
    func body(content: Content) -> some View {
        content.scaleEffect(scale)
    }
}

extension AnyTransition {
    static var customScale: AnyTransition {
        AnyTransition.modifier(active: CustomScaleModifier(scale: 0), identity: CustomScaleModifier(scale: 1))
    }
}
