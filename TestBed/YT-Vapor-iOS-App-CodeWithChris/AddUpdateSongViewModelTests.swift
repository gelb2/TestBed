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
    
    func testNoEmptySongCanBeAdded() {
        XCTAssertTrue(sut.isValidSong(), "song name is valid")
    }
    
    

}
