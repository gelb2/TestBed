//
//  Repository.swift
//  TestBed
//
//  Created by sokol on 2022/02/23.
//

import Foundation

class Repository {
    private let apiURLString = "http://worldclockapi.com/api/json/utc/now"
    
    func fetchNow(_ onCompleted: @escaping (UtcTimeModel) -> ()) {
        let url = apiURLString
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(UtcTimeModel.self, from: data) else { return }
            onCompleted(model)
        }.resume()
    }
}
