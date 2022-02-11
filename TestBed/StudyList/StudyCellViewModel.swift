//
//  StudyCellViewModel.swift
//  TestBed
//
//  Created by sokol on 2022/02/05.
//

import Foundation

class StudyCellViewModel {
    var title: String
    var description: String
    var isExpended: Bool
    
    //TODO: Refactoring Destination Related Logic And Modeling or enumiration
    var destinationVC: Scenes
    
    init(title: String, description: String, destinationVC: Scenes) {
        self.title = title
        self.description = description
        self.destinationVC = destinationVC
        self.isExpended = false
    }
    
    func toggleExpended() {
        self.isExpended = !self.isExpended
    }
}
