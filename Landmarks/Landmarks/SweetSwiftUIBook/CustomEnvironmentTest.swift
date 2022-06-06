//
//  CustomEnvironmentTest.swift
//  Landmarks
//
//  Created by sokol on 2022/06/06.
//

import Foundation
import SwiftUI

//EnvironmentValue를 찾을때 쓸 키
struct MyEnvironmentKey: EnvironmentKey {
    static let defaultValue: Int = 0
}

//연산프로퍼티로 MyEnvironment 밸류의 get set 설정
extension EnvironmentValues {
    var myEnvironment: Int {
        get { self[MyEnvironmentKey.self] }
        set { self[MyEnvironmentKey.self] = newValue }
    }
}

struct MySuperView: View {
    var body: some View {
        MySubView()
            .environment(\.myEnvironment, 10) //myenvironment에 10이라는 값 설정
    }
}

struct MySubView: View {
    
    @Environment(\.myEnvironment) var myValue
    
    var body: some View {
        Text("my value is :\(myValue)") //10
    }
}
