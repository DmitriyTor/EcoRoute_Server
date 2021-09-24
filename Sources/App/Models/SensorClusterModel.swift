//
//  File.swift
//  
//
//  Created by d.toropkin on 24.09.2021.
//

import Foundation
import Vapor

final class SensorClusterModel {
    
    // MARK: - Properties
    
    let coordinate: Coordinates
    
    // MARK: - Lifecycle
    
    init(
        coordinate: Coordinates
    ){
        self.coordinate = coordinate
    }
}

// MARK: - ResponseEncodable

extension SensorClusterModel: ResponseEncodable {
    
    func encodeResponse(for request: Request) -> EventLoopFuture<Response> {
        var headers = HTTPHeaders()
        headers.add(name: .contentType, value: "application/json")
        
        return request.eventLoop.makeSucceededFuture(
            .init(
                status: .ok,
                headers: headers,
                body: .init(
                   
                )
            )
        )
    }
}

// MARK: - Nested types

extension SensorClusterModel {
    
    final class Coordinates {
        let longitude: Float
        let lantitude: Float
        
        init(
            longitude: Float,
            lantitude: Float
        ) {
            self.longitude = longitude
            self.lantitude = lantitude
        }
    }
}
