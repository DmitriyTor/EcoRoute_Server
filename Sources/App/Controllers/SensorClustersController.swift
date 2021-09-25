//
//  SensorClustersController.swift
//  
//
//  Created by d.toropkin on 24.09.2021.
//

import Vapor

struct SensorClustersController {
    
    // MARK: - Properties
    
    private let clusterBuilder = ClusterBuilder()
    
    // MARK: - Public
    
    /// Получение класстера датчиков вместе с POI
    func cluster(
        forPoi poi: EventLoopFuture<[POIModel]>,
        inSquare square: GeoSquareContent
    ) throws -> EventLoopFuture<[SensorClusterModel]> {
        return poi.flatMapThrowing{ pois in
            try clusterBuilder.buildCluster(for: pois, inSquare: square)
        }
    }
}
