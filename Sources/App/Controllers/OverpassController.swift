//
//  OverpassController.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Vapor
import Foundation

/// контроллер запросов в оверпасс за пои
struct OverpassController {
    
    /// Получение POI в заданном квадрате
    func getPOI(
        on appClient: Client,
        in content: GeoSquareContent
    ) throws -> EventLoopFuture<String> {
        let client = appClient
        let headers = HTTPHeaders()
        let uri = URI(
            scheme: .https,
            host: Constants.Endpoints.Overpass.host,
            path: Constants.Endpoints.Overpass.path,
            query: POIParametersBuilder.buildParams(with: content)
        )
        
        return client.get(uri, headers: headers)
            .flatMapThrowing { response -> String in
                let model = try response.content.decode(POIResponseModel.self)
                return "Fisrt poi is \(String(describing: model.elements.first?.lon))"
            }
        
    }
}
