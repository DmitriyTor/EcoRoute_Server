//
//  File.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Vapor

/// Общая моделька респонса POI c оверпаса
struct POIResponseModel: Content {
    let elements: [POIElementResponseModel]
}

/// Моделька респонса POI c оверпаса
struct POIElementResponseModel: Content {
    let type: String
    let lat: Double
    let lon: Double
}
