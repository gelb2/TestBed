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
        defer {
            for i in 0...20 {
                let dummies = StudyCellViewModel(title: "Dummy \(i)", description: "This is Dummy Data Set Real Data", destinationVC: .errorPopup(.Unknown))
                lists.append(dummies)
            }
        }
        
        let declarativeUI = StudyCellViewModel(title: "DeclarativeUI-BearFried", description: "곰튀김의 선언형 UI", destinationVC: .studyTopic(.uiStudy(.DeclarativeUI)))
        let swiftUIPreviewTest = StudyCellViewModel(title: "SwiftUIPreview-Minsone", description: "민소네의 SwiftUI 프리뷰-UIKit", destinationVC: .studyTopic(.uiStudy(.SwiftUIPreviewTest)))
        
        let conclusion_MVVM_Context: SceneContext<ViewModel> = SceneContext(dependency: ViewModel())
        let conclusion_MVVM = StudyCellViewModel(title: "Conclusion-WhatIsMVVM-BearFried", description: "'곰튀김의 MVVM 종결", destinationVC: .studyTopic(.rxSwift(.WhatIsMVVM_Conclusion(conclusion_MVVM_Context))))
        
        let relayExample = StudyCellViewModel(title: "Relay-Example-Bearfried", description: "곰튀김의 Relay 사용과 데이터활용", destinationVC: .studyTopic(.rxSwift(.Relay_How_To_Use)))
        
        let scanExample = StudyCellViewModel(title: "Scan-Example-Udemy/Tomy", description: "Udemy/Tomy의 Scan 사용", destinationVC: .studyTopic(.rxSwift(.scan_How_To_Use)))
        
        let cacheExample = StudyCellViewModel(title: "CacheImage+GCD", description: "이미지 캐싱과 GCD를 이용한 비동기처리", destinationVC: .studyTopic(.gcd(.asyncronous_downloadImage_cache)))
        
        let nsCacheExample_GCD = StudyCellViewModel(title: "NSCacheImage+GCD", description: "NSCache이용한 이미지 캐싱과 GCD를 이용한 비동기처리", destinationVC: .studyTopic(.gcd(.asyncronous_downloadImage_NSCache)))
        
        lists.append(declarativeUI)
        lists.append(swiftUIPreviewTest)
        lists.append(conclusion_MVVM)
        lists.append(relayExample)
        lists.append(scanExample)
        lists.append(cacheExample)
        lists.append(nsCacheExample_GCD)
    }
}
