//
//  LandmarkList.swift
//  Landmarks
//
//  Created by sokol on 2022/05/10.
//

import SwiftUI

struct LandmarkList: View {
    
    var body: some View {
        NavigationView {
            List(landmarks) { landMark in
                NavigationLink {
                    LandmarkDetail(landmark: landMark)
                } label: {
                    LandmarkRow(landmark: landMark)
                }
            }
            .navigationTitle("landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 13"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
