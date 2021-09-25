//
//  SensorController.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation

struct SensorController {
    
    private let sensorDataService = SensorDataService()
    
    /// Получение датчиков в заданном квадрате
    func sensors(for model: GeoSquareContent) throws -> [SensorModel] {
        switch sensorDataService.getData() {
        case let .success(sensors):
            return sensors
        case let .failure(_): // TODO: добавить фетчинг ошибок
            return []
        }
    }
}
