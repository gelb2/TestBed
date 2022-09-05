//
//  AddUpdateSongTests.swift
//  TestBedTests
//
//  Created by sokol on 2022/09/03.
//

import XCTest
@testable import TestBed

class AddUpdateSongViewModelTests: XCTestCase {
    
    var sut: AddUpdateSongViewModel!

    override func setUp() {
        super.setUp()
        sut = AddUpdateSongViewModel(httpClient: MockHTTPClient())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    //노래이름이 스페이스바만 있는 스트링인 경우는 적합하지 않은 노래 이름이라고 간주하고 테스트 작성
    func testNoEmptySongCanBeAdded() {
        sut.songTitle = "larisa"
        
        XCTAssertTrue(sut.isValidSong(), "song name is valid")
    }
    
    func testWhiteSpaceSnogFailed() {
        sut.songTitle = "     "
        
        XCTAssertFalse(sut.isValidSong(), "song name should not be valid")
    }
    
    

}

//위에서 했던 동일한 유닛테스트를 SpyClass를 임의로 만들어서 해본것
class AddUpdateSongViewModelTests_WithSPY_ViewModel: XCTestCase {
    var sut: SpyAddUpdateSongViewModel!

    override func setUp() {
        super.setUp()
        
        //init할때 Fake 객체를 넣어야 할것 같긴 하다.
        sut = SpyAddUpdateSongViewModel(httpClient: MockHTTPClient())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testNoEmptySongCanBeAdded() {
        sut.songTitle = "larisa"
        let isValid = sut.isValidSong()
        
        XCTAssertTrue(isValid, "song name is valid")
    }
    
    func testWhiteSpaceSnogFailed() {
        sut.songTitle = "     "
        let isValid = sut.isValidSong()
        
        XCTAssertFalse(isValid, "song name should not be valid")
    }
}
