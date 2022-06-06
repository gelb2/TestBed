//
//  State_BindingTest.swift
//  Landmarks
//
//  Created by sokol on 2022/06/06.
//

import SwiftUI

struct State_BindingTest: View {
    
    @State private var isFavorite = true
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Toggle(isOn: $isFavorite) {
                Text("isFavorite : \(isFavorite.description)")
            }
            Stepper("count \(count)", value: $count)
        }
    }
}

struct State_BindingTest_Previews: PreviewProvider {
    static var previews: some View {
        State_BindingTest()
    }
}
