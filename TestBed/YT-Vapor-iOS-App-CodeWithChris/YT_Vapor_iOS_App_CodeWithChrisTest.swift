//
//  YT_Vapor_iOS_App_CodeWithChrisTest.swift
//  YT-Vapor-iOS-App-CodeWithChrisTest
//
//  Created by sokol on 2022/09/03.
//

import XCTest
import Combine
@testable import TestBed

class YT_Vapor_iOS_App_CodeWithChrisTest: XCTestCase {
    
    var sut: SongListViewModel!
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        
        //This is beginning of UnitTest
        //DO NOT use Real classes for "API Request", Real Database Modification
        //USE Mocking Classes for testing instead of Real One
        sut = SongListViewModel(httpClient: MockHTTPClient())
        cancellables = []
    }
    
    override func tearDown() {
        sut = nil
        cancellables = []
        super.tearDown()
    }
    
    //뷰모델이 노래를 잘 불러왔다를 판별하는 기준. 일단 갯수만으로 확인해보기.
    //CannedResponse로 쓰일 샘플JSON의 데이터 갯수가 2개이므로
    func testFetchSongsSuccesfully() async throws {
        //Arrange
        let expectation = XCTestExpectation(description: "fetching songs")
        
        //Act
        try await sut.fetchSongs()
        sut.$songs
            .dropFirst()
            .sink { value in
                //Assert
                XCTAssertEqual(2, value.count) //받은 밸류의 갯수가 CannedResponse가 제공한 값의 갯수와 같은가?
                expectation.fulfill() //expectation이 실행되었음을 알린다
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 2) //expectation들이 실행되기를 타임아웃에 정해진 시간 까지 기다린다. 타임아웃이 지날때까지 expectation이 실행되지 않으면 유닛테스트는 실패한다.
    }
}
