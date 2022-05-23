//
//  CategoryHome.swift
//  Landmarks
//
//  Created by pablo.jee on 2022/05/24.
//

import SwiftUI

struct CategoryHome: View {
    var body: some View {
        NavigationView {
            Text("hello world")
                .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Preview: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
