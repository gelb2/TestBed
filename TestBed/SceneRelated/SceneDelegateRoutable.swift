//
//  SceneDelegateRoutable.swift
//  TestBed
//
//  Created by sokol on 2022/02/17.
//

import Foundation
import UIKit

protocol SceneDelegateSceneBuildable: SceneBuildable { }

extension SceneDelegateSceneBuildable {

    func buildStudyListScene(context: SceneContext<StudyModel>) -> Sceneable {
        let nextScene: Sceneable
        //TODO: viewModel init refactor
        let studyModel = context.dependency
        let studyListVC = StudyListViewController(viewModel: studyModel)
        nextScene = studyListVC
        return nextScene
    }
}

protocol SceneDelegateRoutable: Routable, SceneDelegateSceneBuildable {
    var windowScene: UIWindowScene? { get set }
}

extension SceneDelegateRoutable where Self: SceneDelegate {
    
}

extension SceneDelegateRoutable where Self: SceneDelegate {
    func buildScene(scene: SceneCategory) -> Sceneable? {
        var nextScene: Sceneable?
        switch scene {
        case .main(.StudyList(let context)):
            let nextVC = buildStudyListScene(context: context)
            nextScene = nextVC
        default: break
        }
        return nextScene
    }

    func route(to Scene: SceneCategory) {
        guard let scene = buildScene(scene: Scene) else { return }
        setRootVCToWindow(rootVC: scene)
    }
    
    private func setRootVCToWindow(rootVC: Sceneable) {
        guard let vc = rootVC as? UIViewController else { return }
        guard let windowScene = windowScene else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}
