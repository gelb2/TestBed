//
//  EnvironmentObjectTest.swift
//  Landmarks
//
//  Created by sokol on 2022/06/06.
//

import SwiftUI

class AnotherUser: ObservableObject {
    let name = "user name"
    @Published var score = 0
}

struct WholeSuperView: View {
    var body: some View {
        EnvironmentObjectTestSuperView()
            .environmentObject(AnotherUser())
    }
}

struct WholeSuperView_Previews: PreviewProvider {
    static var previews: some View {
        WholeSuperView()
    }
}

struct EnvironmentObjectTestSuperView: View {
    var body: some View {
        EnvironmentObjectTestSubView()
    }
}

struct EnvironmentObjectTestSubView: View {
    
    @EnvironmentObject var user: AnotherUser
    
    var body: some View {
        Text(user.name)
    }
}
