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
        let nextVC = SwiftUIPreviewTestVC()
        return nextVC
    }
    
    func buildDeclarativeUIScene() -> Sceneable {
        return DeclarativeUITestViewController()
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
    //TODO: Protocol Implementation is too long
    // Skip unnecessary Scene case with default
    func buildScene(scene: SceneCategory) -> Sceneable? {
        var nextScene: Sceneable?
        switch scene {
        case .SwiftUIPreviewTest:
            nextScene = buildSwiftUIPreviewScene()
        case .DeclarativeUI:
            nextScene = buildDeclarativeUIScene()
        case .Unknown:
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
