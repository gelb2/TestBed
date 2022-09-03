//
//  Mockable.swift
//  TestBedTests
//
//  Created by sokol on 2022/09/03.
//

//MockHTTPClient is MOCK Class.
//That means This MockHTTPClient class must not call "Real API Call Related Code"
//So We need to make class, protocol for "Canned Response" (ex. JSON Example which has Same(or similar) Key/Value Structure as Real JSON Response From Server
import Foundation

protocol Mockable: AnyObject {
    var bundle: Bundle { get }
    func loadJSON<T: Decodable>(fileName: String, type: T.Type) -> [T]
}

extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSON<T: Decodable>(fileName: String, type: T.Type) -> [T] {
        guard let path = bundle.url(forResource: fileName, withExtension: "json") else {
            fatalError("failed to load json")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode([T].self, from: data)
            return decodedObject
        } catch {
            fatalError("failed decode data")
        }
    }
}
