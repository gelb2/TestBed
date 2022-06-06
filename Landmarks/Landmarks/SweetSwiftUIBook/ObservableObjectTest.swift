//
//  ObservableObjectTest.swift
//  Landmarks
//
//  Created by sokol on 2022/06/06.
//

import SwiftUI

class User: ObservableObject {
    let name = "user name"
    
    //아래와 기능상 같다
    @Published var score = 0
    
    //위와 기능상 같다
    let objectWillChange = ObjectWillChangePublisher()
    var anotherScore = 0 {
        willSet { objectWillChange.send() }
    }
    
}

struct ObservableObjectTest: View {
    
    @ObservedObject var user: User
    
    var body: some View {
        VStack(spacing: 30) {
            Text(user.name)
            
            Button(action: { self.user.score += 1 }) {
                Text(user.score.description)
            }
        }
    }
}

struct ObservableObjectTest_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectTest(user: User())
    }
}
