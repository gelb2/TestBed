//
//  Routable.swift
//  TestBed
//
//  Created by sokol on 2022/02/11.
//

import Foundation
import UIKit

protocol Sceneable {
    
}

extension UIViewController: Sceneable { }

protocol SceneBuildable {
    func buildScene(scene: SceneCategory) -> Sceneable
}

protocol Routable {
    func route(to Scene: SceneCategory)
}

protocol SceneDelegateRoutable: Routable, SceneBuildable {
    
}

extension SceneDelegateRoutable where Self: SceneDelegate {
    func buildScene(scene: SceneCategory) -> Sceneable {
        let nextScene: Sceneable
        //TODO: viewModel init refactor
        let studyModel = StudyModel()
        let studyListVC = StudyListViewController(viewModel: studyModel)
        nextScene = studyListVC
        return nextScene
    }
    
    //this is supposed to do nothing because this class is sceneDelegate
    func route(to Scene: SceneCategory) {
        
    }
}

protocol StudyListRoutable: Routable, SceneBuildable {
    
}

extension StudyListRoutable where Self: StudyListViewController {
    //TODO: Protocol Implementation is too long
    // refactor required
    func buildScene(scene: SceneCategory) -> Sceneable {
        let nextScene: Sceneable
        switch scene {
        case .SwiftUIPreviewTest:
            let nextVC = SwiftUIPreviewTestVC()
            nextScene = nextVC
        case .DeclarativeUI:
            let declarativeUIVC = DeclarativeUITestViewController()
            nextScene = declarativeUIVC
        case .StudyList:
            let studyModel = StudyModel()
            let studyListVC = StudyListViewController(viewModel: studyModel)
            nextScene = studyListVC
        case .Unknown:
            let alert = UIAlertController(title: "UnknownVC", message: "initVC Please", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
            alert.addAction(okAction)
            nextScene = alert
        }
        return nextScene
    }
    
    func route(to Scene: SceneCategory) {
        //TODO: typecasting is too dangerous refactoring required
        let scene = buildScene(scene: Scene) as! UIViewController
        self.present(scene, animated: true, completion: nil)
    }
}

