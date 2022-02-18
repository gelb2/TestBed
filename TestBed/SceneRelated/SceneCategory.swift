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
    case main(mainScene)
    case studyTopic(topicScene)
    case errorPopup(alertType)
    
    enum mainScene {
        case StudyList(SceneContext<StudyModel>)
    }
    
    enum topicScene {
        case uiStudy(uiStudyScene)
        case rxSwfit(rxSwiftScene)
        case dataStructure(dataStructureScene)
        
        enum uiStudyScene {
            case DeclarativeUI
            case SwiftUIPreviewTest
        }
        
        enum rxSwiftScene {
            
        }
        
        enum dataStructureScene {
            
        }
    }
    
    enum alertType {
        case Unknown
        case networkFailed
    }
}
