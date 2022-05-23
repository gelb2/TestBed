//
//  ProfileHost.swift
//  Landmarks
//
//  Created by pablo.jee on 2022/05/24.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive { //사용자가 이 뷰를 에디팅 할 수 없는 상태
                ProfileSummary(profile: modelData.profile)
            } else { //사용자가 이 뷰를 에디팅 할 수 있는 상태
                Text("Profile Editor")
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
