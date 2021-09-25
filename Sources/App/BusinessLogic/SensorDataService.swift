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
            let sensors = try jsonDecoder.decode([SensorModelInternal].self, from: data)
                .map { SensorModel(
                    coordinate: .init(
                        lat: $0.coordinate.lat,
                        long: $0.coordinate.long
                    ),
                    timeStamp: $0.timeStamp,
                    temp: $0.temp,
                    humidity: $0.humidity,
                    CO2: $0.CO2,
                    LOC: $0.LOC,
                    dustPM1_0: $0.dustPM1_0,
                    dustPM2_5: $0.dustPM2_5,
                    dustPM10: $0.dustPM10,
                    pressure: $0.pressure,
                    AQJ: $0.AQJ,
                    formaldehyde: $0.formaldehyde
                )
                }
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
