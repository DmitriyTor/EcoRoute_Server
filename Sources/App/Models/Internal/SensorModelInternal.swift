//
//  File.swift
//  
//
//  Created by d.toropkin on 24.09.2021.
//

import Foundation
import Vapor

/// модель датчика с эксельки
struct SensorModelInternal: Codable {
    
    // MARK: - Properties
    
    /// координаты датчика
    let coordinate: Coordinate
    
    /// штамп датчика
    let timeStamp: Date
    
    /// температура на датчике
    let temp: Double
    
    /// влажность
    let humidity: Double
    
    /// уровень СО2
    let CO2: Double
    
    /// уровень ЛОС (хз че это)
    let LOC: Double
    
    /// Пыль pm 1.0
    let dustPM1_0: Double
    
    /// Пыль pm 2.5
    let dustPM2_5: Double
    
    /// Пыль pm 10
    let dustPM10: Double
    
    /// Давление
    let pressure: Double
    
    /// AQI хз че это
    let AQJ: Double
    
    /// Формальдегид тоже говно какое то
    let formaldehyde: Float

}

// MARK: - Nested types

extension SensorModelInternal {
    
    struct Coordinate: Codable {
        let lat: Double
        let long: Double
    }
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case coordinate, timeStamp, temp, humidity,
             CO2, LOC, dustPM1_0, dustPM2_5, dustPM10, pressure, AQJ,
             formaldehyde
    }
}
