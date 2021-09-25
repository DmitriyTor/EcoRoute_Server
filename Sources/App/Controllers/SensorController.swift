//
//  SensorController.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation

struct SensorController {
    
    private let sensorDataService = SensorDataService()
    private let polygoneService = PolygoneService()
    
    /// Получение датчиков в заданном квадрате
    func sensors(for model: GeoSquareContent) throws -> [SensorModel] {
        switch sensorDataService.getData() {
        case let .success(sensors):
            return sensors
                .filter {
                    polygoneService.checkCount(
                        pointX: $0.coordinate.lat,
                        pointY: $0.coordinate.long,
                        in: model
                    )
                }
        case let .failure(error): // TODO: добавить фетчинг ошибок
            throw error
        }
    }
}
