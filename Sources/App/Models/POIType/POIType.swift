//
//  File.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation

/// Список POI которые запрашиваем. Для добавления нового - добавить просто в enum согласно
/// неймингу отсюда https://wiki.openstreetmap.org/wiki/Map_features
/// 
enum POIType {
  
    enum Amenity: String, CaseIterable {
        case bar = "bar"
        case cafe
        case fast_food
        case pub
        case restaurant
        case library
        case university
        case cinema
        case brothel, swingerclub, stripclub /// потому что хочу, вот почему
        case police
        case theatre
    }
    
    enum Boundary: String, CaseIterable {
        case national_park = "national_park"
    }
    
    enum Leisure: String, CaseIterable {
        case park = "park"
        case garden
        case stadium
    }
}
