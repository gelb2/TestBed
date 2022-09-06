//
//  AddUpdateSongViewModel.swift
//  TestBed
//
//  Created by pablo.jee on 2022/09/02.
//

import Foundation
import SwiftUI

//AddUpdateSongViewModelCheckable은 AddUpdateSongViewModel의 SpyClass를 위한 프로토콜
//SpyClass는 부모클래스의 실제
protocol AddUpdateSongViewModelCheckable {
    
    var songID: UUID? { get set }
    
    var buttonTitle: String { get }
    
    var songTitle: String { get set }
    
    func isValidSong() -> Bool
}


extension AddUpdateSongViewModelCheckable {
    
    //실제 뷰모델 클래스, 뷰모델의 스파이클래스 둘 다 이 메소드를 타게 된다.
    func isValidSong() -> Bool {
        songTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? false : true
    }
}


class AddUpdateSongViewModel: ObservableObject, AddUpdateSongViewModelCheckable {
    @Published var songTitle = ""
    
    var songID: UUID?
    
    var isUpdating: Bool {
        songID != nil
    }
    
    var buttonTitle: String {
        songID != nil ? "Update Song" : "Add Song"
    }
    
    var httpClient: HTTPClientProtocol
    
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
    
    init(currentSong: Song, httpClient: HTTPClientProtocol) {
        self.songTitle = currentSong.title
        self.songID = currentSong.id
        self.httpClient = httpClient
    }
    
    func addSong() async throws {
        let urlString = Constants.baseURL + Endpoints.songs
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let song = Song(id: nil, title: songTitle)
        
        try await httpClient.sendData(to: url,
                                             object: song,
                                             httpMethod: HttpMethods.POST.rawValue)
    }
    
    func addUpdateAction(completion: @escaping () -> Void) {
        Task {
            do {
                if isUpdating {
                     try await updateSong()
                } else {
                    try await addSong()
                }
            } catch {
                print("❌ Error: \(error)")
            }
            completion()
        }
    }
    
    func updateSong() async throws {
        let urlString = Constants.baseURL + Endpoints.songs
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let songToUpdate = Song(id: songID, title: songTitle)
        try await httpClient.sendData(to: url, object: songToUpdate, httpMethod: HttpMethods.PUT.rawValue)
    }
}
