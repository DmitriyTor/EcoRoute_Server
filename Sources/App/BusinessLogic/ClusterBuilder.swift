//
//  File.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation

struct ClusterBuilder {
    
    // MARK: - Properties
    
    private let sensorDataService = SensorDataService.shared
    private let polygoneService = PolygoneService()
    
    // MARK: - Public
    
    func buildCluster(for pois: [POIModel], inSquare square: GeoSquareContent) throws -> [SensorClusterModel] {
        
        var sensors = [SensorModelInternal]()
        
        
        // получим фулл инфу по датчикам
        switch sensorDataService.getData() {
        case let .success(_sensors):
            sensors = _sensors
                .filter {
                    polygoneService.checkCount(
                        pointX: $0.coordinate.lat,
                        pointY: $0.coordinate.long,
                        in: square
                    )
                }
        case let .failure(error):
            throw error
        }
        
        let clusters = sensors.map {
            SensorClusterModel(
                coordinate: SensorClusterModel.Coordinates(
                    lantitude: $0.coordinate.lat,
                    longitude: $0.coordinate.long
                ),
                ecoRaiting: SensorModel.prepareModel($0).ecoRaiting
            )
        }
        
        // проверим, что датчики есть
        guard !clusters.isEmpty else { throw ClusterBuilderError.emptySensors }
        
        pois.forEach { poi in
            
            var minimalDistance = Double(Int.max)
            var clusterIndex = 0
            
            for i in 0..<sensors.count {
                let distance = distance(
                    from: Point(x: sensors[i].coordinate.lat, y: sensors[i].coordinate.long),
                    to: Point(x: poi.lat, y: poi.lon)
                )
                if distance < minimalDistance {
                    clusterIndex = i
                    minimalDistance = distance
                }
            }
            clusters[clusterIndex].pois.append(poi)
            
        }
        return clusters
    }
    
    // MARK: - Private
    
    private func distanceSquared(from: Point, to: Point) -> Double {
        return (from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
    }
    
    private func distance(from: Point, to: Point) -> Double {
        return sqrt(distanceSquared(from: from, to: to))
    }
    
}

extension ClusterBuilder {
    
    enum ClusterBuilderError: Error, LocalizedError {
        case emptySensors
        
        var errorDescription: String? {
            switch self {
            case .emptySensors: return "Чет беда с получением датчиков с хранилища"
            }
        }
    }
}
