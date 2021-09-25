//
//  File.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation
import Vapor

struct SensorModel: Content {
    
    // MARK: - Properties
    
    /// координаты датчика
    let coordinate: Coordinate
    
    /// очки экологии
    let ecoRaiting: Int
    
    static func prepareModel(_ model: SensorModelInternal) -> SensorModel {
        
        let co2Raiting: Int = {
            if model.CO2 < 600 {
                return 20
            }
            if model.CO2 < 700.0 {
                return 15
            }
            if model.CO2 < 800 {
                return 10
            }
            return 5
        }()
        
        let formaldehydeRaiting: Int = {
            if model.formaldehyde < 0.013 {
                return 20
            }
            if model.formaldehyde < 0.016 {
                return 15
            }
            if model.formaldehyde < 0.020 {
                return 10
            }
            return 5
        }()
        
        let dustPM1_0Raiting: Int = {
            if model.dustPM1_0 < 15 {
                return 20
            }
            if model.dustPM1_0 < 20.0 {
                return 10
            }
            return 0
        }()
        
        let dustPM2_5Raiting: Int = {
            if model.dustPM2_5 < 25 {
                return 20
            }
            if model.dustPM2_5 < 30.0 {
                return 10
            }
            return 0
        }()
        
        let dustPM10Raiting: Int = {
            if model.dustPM10 < 30 {
                return 20
            }
            if model.dustPM10 < 35.0 {
                return 10
            }
            return 0
        }()
        
        return SensorModel(
            coordinate: SensorModel.Coordinate.init(lat: model.coordinate.lat, long: model.coordinate.long),
            ecoRaiting: co2Raiting + formaldehydeRaiting + dustPM1_0Raiting + dustPM2_5Raiting + dustPM10Raiting
        )
    }
}

// MARK: - Nested types

extension SensorModel {
    
    struct Coordinate: Content {
        let lat: Double
        let long: Double
    }
}
