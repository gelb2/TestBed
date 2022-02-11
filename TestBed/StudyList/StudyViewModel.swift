//
//  StudyViewModel.swift
//  TestBed
//
//  Created by sokol on 2022/02/05.
//

import Foundation
import SwiftUI

class StudyViewModel {
    //TODO: Consider Which Function Should be handled by This ViewModel
    var studyAnotherFunctionViewModel: String = ""
    
    //ViewModel For ListView
    var studyListViewModel: StudyListViewModel
    
    init() {
        self.studyListViewModel = StudyListViewModel()
    }
}
