//
//  SensorClustersController.swift
//  
//
//  Created by d.toropkin on 24.09.2021.
//

import Vapor

struct SensorClustersController {
    
    // MARK: - Public
    
    /// Получение класстера датчиков вместе с POI
    func cluster(for model: GeoSquareContent) throws -> SensorClusterModel {
        let coordinates = SensorClusterModel.Coordinates(longitude: 1, lantitude: 1)
        return SensorClusterModel(coordinate: coordinates)
    }
}
