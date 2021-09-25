//
//  File.swift
//  
//
//  Created by d.toropkin on 24.09.2021.
//

import Vapor

/// Модель входящая в бэк для квадрата точек
struct GeoSquareContent: Content {
    
    /// левая верхняя точка квадрата
    let leftTopPoint: GeoSquarePoint
    
    /// правая верхняя точка квадрата
    let rightTopPoint: GeoSquarePoint
    
    /// правая нижняя точка квадрата
    let rightBottomPoint: GeoSquarePoint
    
    /// левая нижяя точка квадрата
    let leftBottomPoint: GeoSquarePoint
}

struct GeoSquarePoint: Content {
    let latitude: Double
    let longitude: Double
}
