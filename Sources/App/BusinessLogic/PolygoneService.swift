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
            Point(x: rect.leftTopPoint.x, y: rect.leftTopPoint.y),
            Point(x: rect.rightTopPoint.x, y: rect.rightTopPoint.y),
            Point(x: rect.leftBottomPoint.x, y: rect.leftBottomPoint.y),
            Point(x: rect.rightBottomPoint.x, y: rect.rightBottomPoint.y)
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
