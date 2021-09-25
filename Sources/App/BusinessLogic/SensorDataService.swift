//
//  SensorDataService.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation
import Vapor

/// получение данных с сенсоров с локального джейсончика
struct SensorDataService {
    
    private let jsonDecoder = JSONDecoder()
    
    /// заберем данные с локального файла
    func getData() -> Result<[SensorModel], Error> {
        let url = URL(forResource: "Sensors", type: "json")
        do {
            let data = try Data(contentsOf: url)
            let sensors = try jsonDecoder.decode([SensorModel].self, from: data)
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
