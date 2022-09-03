//
//  Song.swift
//  TestBed
//
//  Created by pablo.jee on 2022/09/02.
//

import Foundation

struct Song: Identifiable, Codable {
    let id: UUID?
    var title: String
}
