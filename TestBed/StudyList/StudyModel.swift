//
//  StudyModel.swift
//  TestBed
//
//  Created by sokol on 2022/02/05.
//

import Foundation

class StudyModel {
    var studyViewModel: StudyViewModel
    //ViewModel For ListView
    var studyListViewModel: StudyListViewModel

    init() {
        self.studyViewModel = StudyViewModel()
        self.studyListViewModel = StudyListViewModel()
    }
}
