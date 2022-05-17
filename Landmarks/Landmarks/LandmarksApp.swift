//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by sokol on 2022/05/09.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
