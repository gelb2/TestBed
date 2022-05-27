//
//  LandmarksApp.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by pablo.jee on 2022/05/27.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
