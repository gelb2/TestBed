//
//  DateResponseModel.swift
//  TestBed
//
//  Created by sokol on 2022/02/22.
//

import Foundation

struct DateResponseModel: Codable {
    var id: String
    var currentDateTime: String
    var utcOffset: String
    var isDayLightSavingsTime: Bool
    var dayOfTheWeek: String
    var timeZoneName: String
    var currentFileTime: Int
    var ordinalDate: String
    var serviceResponse: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case currentDateTime
        case utcOffset
        case isDayLightSavingsTime
        case dayOfTheWeek
        case timeZoneName
        case currentFileTime
        case ordinalDate
        case serviceResponse
    }
}

/*****
 let json = """
{"$id":"1",
"currentDateTime":"2022-02-22T05:54Z",
"utcOffset":"00:00:00",
"isDayLightSavingsTime":false,
"dayOfTheWeek":"Tuesday",
"timeZoneName":"UTC",
"currentFileTime":132899828682597138,
"ordinalDate":"2022-53",
"serviceResponse":null}
"""
 *****/
