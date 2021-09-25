//
//  File.swift
//  
//
//  Created by d.toropkin on 24.09.2021.
//

import Foundation
import Vapor

final class SensorClusterModel: Content {
    
    // MARK: - Properties
    
    let coordinate: Coordinates
    let ecoRaiting: Int
    var pois: [POIModel] = []
    
    // MARK: - Lifecycle
    
    init(
        coordinate: Coordinates,
        ecoRaiting: Int
    ){
        self.coordinate = coordinate
        self.ecoRaiting = ecoRaiting
    }
}

// MARK: - Nested types

extension SensorClusterModel {
    
    final class Coordinates: Content {
        let longitude: Double
        let lantitude: Double
        
        init(
            lantitude: Double,
            longitude: Double
        ) {
            self.longitude = longitude
            self.lantitude = lantitude
        }
    }
}
