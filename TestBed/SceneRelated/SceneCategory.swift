//
//  Scenes.swift
//  TestBed
//
//  Created by sokol on 2022/02/05.
//

import Foundation
//TODO: make More Scene Enums And Categorize Scenes with NestedEnums
//TODO: Make Scenes Accept Params(SceneContext, another Related Scenes)
enum SceneCategory {
    case StudyList(SceneContext<StudyModel>)
    case SwiftUIPreviewTest
    case DeclarativeUI
    case Unknown
}
