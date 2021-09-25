//
//  SensorDataService.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation

/// получение данных с сенсоров с локального джейсончика
struct SensorDataService {
    
    private let jsonDecoder = JSONDecoder()
    
    /// заберем данные с локального файла
    func getData() -> Result<[SensorModel], SensorError> {
        guard let filePath = Bundle.main.url(forResource: "Sensors", withExtension: "json")
        else {
            return .failure(.cantFindPath)
        }
        
        do {
            let data = try Data(contentsOf: filePath)
            let sensors = try jsonDecoder.decode([SensorModel].self, from: data)
            return .success(sensors)
        } catch {
            return .failure(.cantDecode)
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
