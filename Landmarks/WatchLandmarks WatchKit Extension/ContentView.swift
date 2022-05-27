//
//  ContentView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by pablo.jee on 2022/05/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
