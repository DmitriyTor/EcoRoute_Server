//
//  OverpassController.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Vapor
import Foundation

/// контроллер запросов в оверпасс за пои
final class OverpassController {
    
    /// Получение POI в заданном квадрате
    func getPOI(
        on appClient: Client,
        in content: GeoSquareContent
    ) throws -> EventLoopFuture<[POIModel]> {
        let client = appClient
        let headers = HTTPHeaders()
        let uri = URI(
            scheme: .https,
            host: Constants.Endpoints.Overpass.host,
            path: Constants.Endpoints.Overpass.path,
            query: POIParametersBuilder.buildParams(with: content)
        )
        
        return client.get(uri, headers: headers)
            .flatMapThrowing { response -> [POIModel] in
                let model = try response.content.decode(POIResponseModel.self)
                return model.elements
                    .map {
                        POIModel(type: $0.type, lat: $0.lat, lon: $0.lon, name: $0.tags?.name ?? "NoName")
                    }
            }
    }
}

extension OverpassController {
    
    enum OverpassControllerError: Error {
        case selfIsNil
    }
}
