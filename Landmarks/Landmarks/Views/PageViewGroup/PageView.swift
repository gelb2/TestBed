//
//  PageView.swift
//  Landmarks
//
//  Created by pablo.jee on 2022/05/27.
//

import Foundation
import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 10))
                .padding(.trailing)
        }
        
    }
}

struct PageView_Previews: PreviewProvider {
    static var data = ModelData().features.map { FeatureCard(landMark: $0) }
    
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landMark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
