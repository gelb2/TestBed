//
//  Routable.swift
//  TestBed
//
//  Created by sokol on 2022/02/11.
//

import Foundation
import UIKit

//TODO: Make Routable dismiss scene, push navi, pop navi possible
protocol Sceneable {
    
}

extension UIViewController: Sceneable { }

protocol SceneBuildable {
    func buildScene(scene: SceneCategory) -> Sceneable?
}

protocol Routable {
    func route(to Scene: SceneCategory)
}




