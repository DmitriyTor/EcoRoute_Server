//
//  POIParametersBuilder.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation

/// Структурка для создания параметров для запроса в оверпасс
struct POIParametersBuilder {
    
    static func buildParams(with geoSquare: GeoSquareContent) -> String {
        let poiTypes: String = [
            POIType.Amenity.allCases
                .map { return "[amenity=\($0)]"}
                .joined(),
            
            POIType.Boundary.allCases
                .map { return "[boundary=\($0)]"}
                .joined(),
            
            POIType.Leisure.allCases
                .map { return "[leisure=\($0)]"}
                .joined()
        ].joined()
        
        let geoPoints = [
            String(describing: geoSquare.leftTopPoint.latitude),
            String(describing: geoSquare.leftTopPoint.longitude),
            String(describing: geoSquare.rightBottomPoint.latitude),
            String(describing: geoSquare.rightBottomPoint.longitude)
        ].joined(separator: ",")
        
        let requiredFiles = "data=[out:json];node"
        
        return requiredFiles + poiTypes + "(" + geoPoints + ")" + ";out;"
    }
}
