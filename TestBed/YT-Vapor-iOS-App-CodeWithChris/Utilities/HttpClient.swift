//
//  HttpClient.swift
//  TestBed
//
//  Created by pablo.jee on 2022/09/02.
//

import Foundation

enum HttpMethods: String {
    case POST, GET, PUT, DELETE
}

enum MINEType: String {
    case JSON = "application/json"
}

enum HttpHeaders: String {
    case contentType = "Content-Type"
}

enum HttpError: Error {
    case badURL, badResponse, errorDecodingData, invalidURL
}

//To isolate UnitTest from the real environment(ex. internet, Real Database)
//make protocol and force the class adapt the protocol
//this protocol is going to be adapted by MockHttpClient class in UnitTest Related File
//HTTPClient instance in viewModel also adapt this protocol
protocol HTTPClientProtocol {
    func fetch<T: Codable>(url: URL) async throws -> [T]
    func sendData<T: Codable>(to url: URL, object: T, httpMethod: String) async throws
    func delete(at id: UUID, url: URL) async throws
}

class HttpClient: HTTPClientProtocol {
    
    
    func fetch<T: Codable>(url: URL) async throws -> [T] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }
        
        guard let object = try? JSONDecoder().decode([T].self, from: data) else {
            throw HttpError.errorDecodingData
        }
        return object
    }
    
    func sendData<T: Codable>(to url: URL, object: T, httpMethod: String) async throws {
        var request = URLRequest(url: url)
        
        request.httpMethod = httpMethod
        request.addValue(MINEType.JSON.rawValue, forHTTPHeaderField: HttpHeaders.contentType.rawValue)
        
        request.httpBody = try? JSONEncoder().encode(object)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }
    }
    
    func delete(at id: UUID, url: URL) async throws {
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethods.DELETE.rawValue
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }
    }
}
