//
//  File.swift
//  
//
//  Created by d.toropkin on 24.09.2021.
//

import Vapor

struct GeoSquareContent: Content {
    
    /// левая верхняя точка квадрата
    let leftTopPoint: Float
    
    /// правая верхняя точка квадрата
    let rightTopPoint: Float
    
    /// правая нижняя точка квадрата
    let rightBottomPoint: Float
    
    /// левая нижяя точка квадрата
    let leftBottomPoint: Float
}
