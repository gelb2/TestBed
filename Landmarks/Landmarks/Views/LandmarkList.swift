//
//  LandmarkList.swift
//  Landmarks
//
//  Created by sokol on 2022/05/10.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = true
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredLandmarks) { landMark in
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
        LandmarkList()
    }
}
