//
//  CustomViewModifier.swift
//  Landmarks
//
//  Created by sokol on 2022/06/21.
//

import Foundation
import SwiftUI

struct CustomViewModifier: ViewModifier {
    var borderColor: Color = .red
    
    func body(content: Content) -> some View {
        content //모디파이어가 적용될 대상
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(Rectangle().fill(Color.gray))
            .border(borderColor, width: 2)
    }
}

struct AnotherModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
    }
}

struct ModifierTestView: View {
    
    var body: some View {
        
        VStack {
            Text("hello")
                .modifier(CustomViewModifier().concat(AnotherModifier()))
            Text("World")
                .orangeBorder(borderColor: .orange)
                .font(.largeTitle)
        }
        
        
    }
}

struct ModifierTestView_Preview: PreviewProvider {
    static var previews: some View {
        ModifierTestView()
    }
}

extension View {
    func orangeBorder(borderColor: Color = .orange) -> some View {
        self
            .modifier(CustomViewModifier(borderColor: borderColor))
    }
}
