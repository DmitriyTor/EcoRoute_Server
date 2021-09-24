//
//  SensorClusters.swift
//  
//
//  Created by d.toropkin on 24.09.2021.
//

import Vapor

final class SensorClusters {

    func test(req: Request) throws -> String {
        return "Your test success"
    }
    
    func test1(req: Request) throws -> String {
        let geoSquare = try req.content.decode(GeoSquareContent.self)
        return "Your square leftTopPoint is \(geoSquare.leftTopPoint)"
    }
    
    func cluster(req: Request) throws -> SensorClusterModel {
        let geoSquare = try req.content.decode(GeoSquareContent.self)

        let coordinates = SensorClusterModel.Coordinates(longitude: 1, lantitude: 1)
        return SensorClusterModel(coordinate: coordinates)
    }
}
