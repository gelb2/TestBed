//
//  ColorExtension.swift
//  Landmarks
//
//  Created by sokol on 2022/06/05.
//

import SwiftUI

extension Color {
    static let peach = Color("peach")
    static let primaryShadow = Color.primary.opacity(0.3)
    static let secondaryText = Color(hex: "#6e6e6e")
    static let background = Color(UIColor.systemGray6) //UIColor로 Color 생성
    
    //hex String으로 Color 생성
    init(hex: String) {
        
        let scanner = Scanner(string: hex) //문자열 파서
        _ =  scanner.scanString("#") //# 제거
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb) //문자열을 int64 타입으로 변환해 rgb 변수에 저장. 변환 못하면 0을 반환
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0 //좌측 문자열 2개 추출
        let g = Double((rgb >> 8 ) & 0xFF) / 255.0 //중간 문자열 2개 추출
        let b = Double((rgb >> 0) & 0xFF) / 255.0 // 우측 문자열 2개 추출
        
        self.init(red: r, green: g, blue: b)
    }
}
