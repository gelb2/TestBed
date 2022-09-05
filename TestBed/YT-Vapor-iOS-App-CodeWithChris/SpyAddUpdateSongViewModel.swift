//
//  SpyHTTPClient.swift
//  YT-Vapor-iOS-App-CodeWithChrisTest
//
//  Created by pablo.jee on 2022/09/05.
//

import Foundation
import Combine
@testable import TestBed


final class SpyAddUpdateSongViewModel: AddUpdateSongViewModelCheckable {
    
    var songID: UUID?
    
    @Published var songTitle: String = ""
    
    private var fakeHttpClient: HTTPClientProtocol
    
    init(fakeInstance: HTTPClientProtocol) {
        self.fakeHttpClient = fakeInstance
        self.songID = UUID()
    }
}

extension AddUpdateSongViewModelCheckable where Self: SpyAddUpdateSongViewModel {
    //Spy클래스를 쓸 경우엔 여길 탄다...이게 깔끔한 구현인지 아닌진 차치하고서라도...
    var buttonTitle: String {
        songID != nil ? "노래업데이트하기" : "노래추가하기"
    }
}
