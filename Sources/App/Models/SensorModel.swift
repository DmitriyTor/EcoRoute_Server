//
//  File.swift
//  
//
//  Created by d.toropkin on 24.09.2021.
//

import Foundation


/// модель датчика с эксельки
final class SensorModel {
    
    // MARK: - Properties
    
    /// штамп датчика
    let timeStamp: Date
    
    /// температура на датчике
    let temp: Double
    
    /// влажность
    let humidity: Double
    
    /// уровень СО2
    let co2: Double
    
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
    
    // MARK: - Lifecycle
    
    init(
        timeStamp: Date,
        temp: Double,
        humidity: Double,
        co2: Double,
        LOC: Double,
        dustPM1_0: Double,
        dustPM2_5: Double,
        dustPM10: Double,
        pressure: Double,
        AQJ: Double,
        formaldehyde: Float
    ) {
        self.timeStamp = timeStamp
        self.temp = temp
        self.humidity = humidity
        self.co2 = co2
        self.LOC = LOC
        self.dustPM1_0 = dustPM1_0
        self.dustPM2_5 = dustPM2_5
        self.dustPM10 = dustPM10
        self.pressure = pressure
        self.AQJ = AQJ
        self.formaldehyde = formaldehyde
    }
}
