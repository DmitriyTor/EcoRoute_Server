//
//  File.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation

extension GeoSquareContent {
    func getParametrsForOverpass() -> String {
        "data=[out:json];node[highway=speed_camera](\(leftTopPoint),\(rightTopPoint),\(rightBottomPoint),\(leftBottomPoint));out;"
    }
}
