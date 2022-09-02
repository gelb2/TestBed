//
//  NSCache+Extension.swift
//  TestBed
//
//  Created by sokol on 2022/08/16.
//

import Foundation

extension NSCache {
    @objc static var sharedCache: NSCache<AnyObject, AnyObject> {
        let cache = NSCache<AnyObject, AnyObject>()
        return cache
    }
}
