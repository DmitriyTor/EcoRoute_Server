//
//  File.swift
//  
//
//  Created by d.toropkin on 24.09.2021.
//

import Foundation

/// Cтруктура для проверки входит ли точка в квадрат
struct PolygoneService {
    
    func checkCount(
        pointX: Double,
        pointY: Double,
        in rect: GeoSquareContent
    ) -> Bool {
        
        let polygon = Polygon(points: [
            Point(x: rect.leftTopPoint.latitude, y: rect.leftTopPoint.longitude),
            Point(x: rect.rightTopPoint.latitude, y: rect.rightTopPoint.longitude),
            Point(x: rect.leftBottomPoint.latitude, y: rect.leftBottomPoint.longitude),
            Point(x: rect.rightBottomPoint.latitude, y: rect.rightBottomPoint.longitude)
        ])
        
        return polygon.contains(
            point:
                Point(
                    x: pointX,
                    y: pointY
                )
        )
    }
}
