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
        let swiftUIPreviewTest = StudyCellViewModel(title: "SwiftUIPreview-Minsone", description: "민소네의 SwiftUI 프리뷰-UIKit", destinationVC: .studyTopic(.uiStudy(.SwiftUIPreviewTest)))
        
        let conclusion_MVVM_Context: SceneContext<ViewModel> = SceneContext(dependency: ViewModel())
        let conclusion_MVVM = StudyCellViewModel(title: "Conclusion-WhatIsMVVM-BearFried", description: "'곰튀김의 MVVM 종결", destinationVC: .studyTopic(.rxSwift(.WhatIsMVVM_Conclusion(conclusion_MVVM_Context))))
        
        let relayExample = StudyCellViewModel(title: "Relay-Example-Bearfried", description: "곰튀김의 Relay 사용과 데이터활용", destinationVC: .studyTopic(.rxSwift(.Relay_How_To_Use)))
        
        lists.append(declarativeUI)
        lists.append(swiftUIPreviewTest)
        lists.append(conclusion_MVVM)
        lists.append(relayExample)
        
        for i in 0...20 {
            let dummies = StudyCellViewModel(title: "Dummy \(i)", description: "This is Dummy Data Set Real Data", destinationVC: .errorPopup(.Unknown))
            lists.append(dummies)
        }
    }
}
