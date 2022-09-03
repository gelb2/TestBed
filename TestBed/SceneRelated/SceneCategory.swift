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
    
    //앱이 처음 켜졌을 시 사용 가능한 Scene. StudyList도 언젠간 다른 Scene이 되고 해당 scene엔 다른 탭바 같은 씬이 올 수 있음.
    enum mainScene {
        case StudyList(SceneContext<StudyModel>)
    }
    
    //특정 씬에서 행동을 했을 때 타고 들어갈 다른 씬...
    enum topicScene {
        case uiStudy(uiStudyScene)
        case rxSwift(rxSwiftScene)
        case dataStructure(dataStructureScene)
        case gcd(gcdScene)
        case unitTest(unitTestScene)
        
        enum uiStudyScene {
            case DeclarativeUI
            case SwiftUIPreviewTest
        }
        
        enum rxSwiftScene {
            case WhatIsMVVM_Conclusion(SceneContext<ViewModel>)
            case Relay_How_To_Use
            case scan_How_To_Use
        }
        
        enum gcdScene {
            case asyncronous_downloadImage_cache
            case asyncronous_downloadImage_NSCache
        }
        
        enum unitTestScene {
            case youtube_codeWithChris_unitTest_TDD
        }
        
        enum dataStructureScene {
            
        }
    }
    
    enum alertType {
        case Unknown
        case networkFailed
    }
}
