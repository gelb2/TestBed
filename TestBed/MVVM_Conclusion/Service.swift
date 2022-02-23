//
//  Logic.swift
//  TestBed
//
//  Created by sokol on 2022/02/23.
//

import Foundation


class Service {
    
    let repository = Repository()
    
    var currentModel = Model(currentDateTime: Date(), isDayLightSavingsTime: false)
    
    func fetchNow(onCompleted: @escaping (Model) -> ()) {
        repository.fetchNow { [weak self] entity in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
            
            guard let now = formatter.date(from: entity.currentDateTime) else { return }
            let isDayLightSavingsTime = entity.isDayLightSavingsTime
            
            let model = Model(currentDateTime: now, isDayLightSavingsTime: isDayLightSavingsTime)
            self?.currentModel = model
            onCompleted(model)
        }
    }
    
    func moveDay(day: Int){
        guard let movedDay = Calendar.current.date(byAdding: .day, value: day, to: currentModel.currentDateTime) else {
            return
        }
        currentModel.currentDateTime = movedDay
    }
}
