//
//  NotificationView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by pablo.jee on 2022/05/27.
//

import SwiftUI

struct NotificationView: View {
    
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if landmark != nil {
                CircleImage(image: landmark!.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "unknown landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "you are within 5miles of one of your favorite landmarks")
                .font(.caption)
        }
        .lineLimit(0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
            NotificationView(title: "turtle rock", message: "you are within 5miles of turtle rock", landmark:  ModelData().landmarks[0])
        }
    }
}
