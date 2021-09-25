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
            String(describing: geoSquare.leftTopPoint.x),
            String(describing: geoSquare.leftTopPoint.y),
            String(describing: geoSquare.rightBottomPoint.x),
            String(describing: geoSquare.rightBottomPoint.y)
        ].joined(separator: ",")
        
        let requiredFiles = "data=[out:json];node"
        
        return requiredFiles + poiTypes + "(" + geoPoints + ")" + ";out;"
    }
}
