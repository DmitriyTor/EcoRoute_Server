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
    
    // MARK: - Lifecycle
    
    init(
        coordinate: Coordinates
    ){
        self.coordinate = coordinate
    }
}

// MARK: - Nested types

extension SensorClusterModel {
    
    final class Coordinates: Content {
        let longitude: Float
        let lantitude: Float
        
        init(
            longitude: Float,
            lantitude: Float
        ) {
            self.longitude = longitude
            self.lantitude = lantitude
        }
    }
}
