//
//  CategoryHome.swift
//  Landmarks
//
//  Created by pablo.jee on 2022/05/24.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
            }.navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Preview: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
