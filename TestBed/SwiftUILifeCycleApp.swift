//
//  SwiftUILifeCycleApp.swift
//  TestBed
//
//  Created by sokol on 2021/12/24.
//

import Foundation
import SwiftUI

//앱의 시작점인 엔트리포인트 지정
//https://docs.swift.org/swift-book/ReferenceManual/Attributes.html#ID626
//우선 해당 리서치가 끝나면 아래 주석을 풀고 구현해보자
//@main

struct SwiftUILifeCycleApp: App {
    //iOS 14부터 제공되는 scenePhase
    //an indication of a scene's operational state
    @Environment(\.scenePhase) var scenePhase
    
    //앱델리게이트
    //https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-an-appdelegate-to-a-swiftui-app
    //https://developer.apple.com/documentation/swiftui/uiapplicationdelegateadaptor
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                print(appDelegate.test())
                print("app is active")
            case .inactive:
                print("app is inactive")
            case .background:
                print("app is background")
            @unknown default:
                print("next version of swiftUI Handle More App State")
            }
        }
    }
}
