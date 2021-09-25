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
    let leftTopPoint: Double
    
    /// правая верхняя точка квадрата
    let rightTopPoint: Double
    
    /// правая нижняя точка квадрата
    let rightBottomPoint: Double
    
    /// левая нижяя точка квадрата
    let leftBottomPoint: Double
}
