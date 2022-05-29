//
//  FeatureCard.swift
//  Landmarks
//
//  Created by pablo.jee on 2022/05/27.
//

import SwiftUI

struct FeatureCard: View {
    
    var landMark: Landmark
    
    var body: some View {
//        landMark.featureImage?
//            .resizable()
//            .aspectRatio(3 / 2, contentMode: .fit)
//            .overlay {
//                TextOverlay(landmark: landMark)
//            }
        ZStack {
            landMark.featureImage?
                .resizable()
                .aspectRatio(3 / 2, contentMode: .fit)
            TextOverlay(landmark: landMark)
        }
    }
}

struct TextOverlay: View {
    var landmark: Landmark
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landMark: ModelData().features[0])
    }
}
