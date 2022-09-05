//
//  SpyHTTPClient.swift
//  YT-Vapor-iOS-App-CodeWithChrisTest
//
//  Created by pablo.jee on 2022/09/05.
//

import Foundation
@testable import TestBed

//사실 AddUpdateSongViewModel 클래스를 직접 상속받는게 아니라 AddUpdateSongViewModelProtocol 같은 프로토콜을 채택하는 식으로 수정 하는 것이 맞는 걸로 보인다.
final class SpyAddUpdateSongViewModel: AddUpdateSongViewModel {
    override func isValidSong() -> Bool {
        super.isValidSong()
    }
}
