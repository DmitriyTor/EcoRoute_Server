//
//  File.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation
import Vapor

struct POIModel: Content {
    let type: String
    let lat: Double
    let lon: Double
    let name: String
}
