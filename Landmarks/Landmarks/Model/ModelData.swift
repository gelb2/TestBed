//
//  ModelData.swift
//  Landmarks
//
//  Created by sokol on 2022/05/10.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("file name error")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("cannot load file from data url")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("cannot parse file as \(T.self)")
    }
    
}
