//
//  MockHTTPClient.swift
//  YT-Vapor-iOS-App-CodeWithChrisTest
//
//  Created by sokol on 2022/09/03.
//

import Foundation
@testable import TestBed
//to make unitTest for the code that related to internet, real DataBase
//DO NOT USE Real Server API, DO NOT add or remove data from real database
//instead of using real api, real Database, we must use mockClass
////////
//MockHTTPClient is MOCK Class.
//That means This MockHTTPClient class must not call "Real API Call Related Code"
//So We need to make class, protocol for "Canned Response" (ex. JSON Example which has Same(or similar) Key/Value Structure as Real JSON Response From Server
final class MockHTTPClient: HTTPClientProtocol, Mockable {
    
    func fetch<T: Codable>(url: URL) async throws -> [T] {
        return loadJSON(fileName: "SongResponse", type: T.self)
    }
    
    func sendData<T>(to url: URL, object: T, httpMethod: String) async throws where T : Decodable, T : Encodable {
        
    }
    
    func delete(at id: UUID, url: URL) async throws {
        
    }
}
