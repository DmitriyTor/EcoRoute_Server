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
        
        let directory = DirectoryConfiguration.detect()
        let configDir = "Sources/Resources"
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: directory.workingDirectory)
                                    .appendingPathComponent(configDir, isDirectory: true)
                                    .appendingPathComponent("Sensors.json", isDirectory: false))
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
