//
//  SceneContext.swift
//  TestBed
//
//  Created by sokol on 2022/02/17.
//
//TODO: Make SceneContext Fully Operational With ViewModel And UseCaseProtocol instances
//SceneContext is a generic Class for holding UseCaseProtocol instance, ViewModel instance
import Foundation

class SceneContext<Context> {
    
    var context: Context
    
    init(context: Context) {
        self.context = context
    }
}
