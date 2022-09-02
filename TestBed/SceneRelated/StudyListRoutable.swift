//
//  StudyListRoutable.swift
//  TestBed
//
//  Created by sokol on 2022/02/17.
//

import Foundation
import UIKit

protocol StudyListSceneBuildable: SceneBuildable { }

extension StudyListSceneBuildable {
    func buildSwiftUIPreviewScene() -> Sceneable {
        return SwiftUIPreviewTestVC()
    }
    
    func buildDeclarativeUIScene() -> Sceneable {
        return DeclarativeUITestViewController()
    }
    
    func buildMVVM_ConclusionScene(context: SceneContext<ViewModel>) -> Sceneable {
        let viewModel = context.dependency
        return MVVM_ConclusionViewController(viewModel: viewModel)
    }
    
    func buildRelayExampleScene() -> Sceneable {
        return RelayExampleViewController()
    }
    
    func buildScanExampleScene() -> Sceneable {
        return ScanExampleViewController()
    }
    
    func buildAsyncDownloadingScene() -> Sceneable {
        return AsyncDownloadExampleViewController()
    }
    
    func buildAsyncDownloading_NSCache_Scene() -> Sceneable {
        return AsyncDownloadExampleViewController_NSCache()
    }
    
    func buildErrorAlert() -> Sceneable {
        let alert = UIAlertController(title: "UnknownVC", message: "initVC Please", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(okAction)
        return alert
    }
}

protocol StudyListRoutable: Routable, StudyListSceneBuildable {
    
}

extension StudyListRoutable where Self: StudyListViewController {

    func buildScene(scene: SceneCategory) -> Sceneable? {
        var nextScene: Sceneable?
        switch scene {
        case .studyTopic(.uiStudy(.SwiftUIPreviewTest)):
            nextScene = buildSwiftUIPreviewScene()
        case .studyTopic(.uiStudy(.DeclarativeUI)):
            nextScene = buildDeclarativeUIScene()
        case .studyTopic(.rxSwift(.WhatIsMVVM_Conclusion(let context))):
            nextScene = buildMVVM_ConclusionScene(context: context)
        case .studyTopic(.rxSwift(.Relay_How_To_Use)):
            nextScene = buildRelayExampleScene()
        case .studyTopic(.rxSwift(.scan_How_To_Use)):
            nextScene = buildScanExampleScene()
        case .studyTopic(.gcd(.asyncronous_downloadImage_cache)):
            nextScene = buildAsyncDownloadingScene()
        case .studyTopic(.gcd(.asyncronous_downloadImage_NSCache)):
            nextScene = buildAsyncDownloading_NSCache_Scene()
        case .errorPopup(.Unknown):
            nextScene = buildErrorAlert()
        default: break
        }
        
        return nextScene
    }
    
    func route(to Scene: SceneCategory) {
        guard let scene = buildScene(scene: Scene) as? UIViewController else { return }
        self.present(scene, animated: true, completion: nil)
    }
}
