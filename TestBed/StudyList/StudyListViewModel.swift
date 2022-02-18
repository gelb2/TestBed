//
//  StudyListViewModel.swift
//  TestBed
//
//  Created by sokol on 2022/02/06.
//

import Foundation

class StudyListViewModel {
    var lists: [StudyCellViewModel]
    
    init() {
        self.lists = []
        populateStudyData()
    }
    
    func populateStudyData() {
        let declarativeUI = StudyCellViewModel(title: "DeclarativeUI-BearFried", description: "곰튀김의 선언형 UI", destinationVC: .studyTopic(.uiStudy(.DeclarativeUI)))
        lists.append(declarativeUI)
        
        for i in 0...20 {
            let dummies = StudyCellViewModel(title: "Dummy \(i)", description: "This is Dummy Data Set Real Data", destinationVC: .errorPopup(.Unknown))
            lists.append(dummies)
        }
    }
}
