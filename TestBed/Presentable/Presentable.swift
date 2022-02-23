//
//  Presentable.swift
//  TestBed
//
//  Created by sokol on 2022/02/22.
//

import Foundation
import UIKit

protocol Presentable {
    func initViewHierachy()
    func configureViews()
    func bind()
}
