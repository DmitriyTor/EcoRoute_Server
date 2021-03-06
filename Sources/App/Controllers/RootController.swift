//
//  RootController.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation
import Vapor

final class RootController {
    
    private let sensorClusterController = SensorClustersController()
    private let sensorController = SensorController()
    private let overpassController = OverpassController()
    
    /// Получение класстера датчиков вместе с POI
    func cluster(req: Request) throws -> EventLoopFuture<[SensorClusterModel]> {
        let geoSquare = try req.content.decode(GeoSquareContent.self)
        let poi = try overpassController.getPOI(on: req.client, in: geoSquare)
        return try sensorClusterController.cluster(forPoi: poi, inSquare: geoSquare)
    }
    
    /// Получение датчиков в заданном квадрате
    func sensors(req: Request) throws -> [SensorModel] {
        let geoSquare = try req.content.decode(GeoSquareContent.self)
        return try sensorController.sensors(for: geoSquare)
    }
    
    /// Получение POI в заданном квадрате
    func poi(req: Request) throws -> EventLoopFuture<[POIModel]> {
        let geoSquare = try req.content.decode(GeoSquareContent.self)
        return try overpassController.getPOI(on: req.client, in: geoSquare)
    }
}
