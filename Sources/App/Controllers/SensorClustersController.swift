//
//  SensorClustersController.swift
//  
//
//  Created by d.toropkin on 24.09.2021.
//

import Vapor

final class SensorClustersController {
    
    // MARK: - Properties
    
    private let overpassController = OverpassController()
    
    // MARK: - Public
    
    /// Получение класстера датчиков вместе с POI
    func cluster(req: Request) throws -> SensorClusterModel {
        let geoSquare = try req.content.decode(GeoSquareContent.self)
        let coordinates = SensorClusterModel.Coordinates(longitude: 1, lantitude: 1)
        return SensorClusterModel(coordinate: coordinates)
    }
    
    /// Получение датчиков в заданном квадрате
    func sensors(req: Request) throws -> SensorClusterModel {
        let geoSquare = try req.content.decode(GeoSquareContent.self)
        let coordinates = SensorClusterModel.Coordinates(longitude: 1, lantitude: 1)
        return SensorClusterModel(coordinate: coordinates)
    }
    
    /// Получение POI в заданном квадрате
    func poi(req: Request) throws -> EventLoopFuture<String> {
        let geoSquare = try req.content.decode(GeoSquareContent.self)
        let poi = try overpassController.getPOI(on: req.client, in: geoSquare)
        return poi
    }
}
