//
//  SensorDataService.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation
import Vapor

/// получение данных с сенсоров с локального джейсончика
final class SensorDataService {
    
    static let shared = SensorDataService()
    private let jsonDecoder = JSONDecoder()
    private var sensors: [SensorModelInternal]?
    
    private init() {}
    
    /// заберем данные с локального файла
    func getData() -> Result<[SensorModelInternal], Error> {
        if let sensors = sensors {
            return .success(sensors)
        }
        let url = URL(forResource: "Sensors", type: "json")
        do {
            let data = try Data(contentsOf: url)
            let sensors = try jsonDecoder.decode([SensorModelInternal].self, from: data)
            self.sensors = sensors
            return .success(sensors)
        } catch {
            return .failure(error)
        }
    }
}

// MARK: - Nested types

extension SensorDataService {
    
    enum SensorError: Error {
        case cantFindPath
        case cantDecode
    }
}
