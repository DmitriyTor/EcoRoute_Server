//
//  SensorDataService.swift
//  
//
//  Created by d.toropkin on 25.09.2021.
//

import Foundation
import Vapor

/// получение данных с сенсоров с локального джейсончика
struct SensorDataService {
    
    private let jsonDecoder = JSONDecoder()
    
    /// заберем данные с локального файла
    func getData() -> Result<[SensorModel], Error> {
        let url = URL(forResource: "Sensors", type: "json")
        do {
            let data = try Data(contentsOf: url)
            let sensors = try jsonDecoder.decode([SensorModel].self, from: data)
            return .success(sensors)
        } catch {
            return .failure(error)
        }
    }
}

// MARK: - Nested types

extension SensorDataService {
    
    enum SensorError: Error {
        case cantFindPath
        case cantDecode
    }
}

fileprivate let _resources: URL = {
    func packageRoot(of file: String) -> URL? {
        func isPackageRoot(_ url: URL) -> Bool {
            let filename = url.appendingPathComponent("Package.swift", isDirectory: false)
            return FileManager.default.fileExists(atPath: filename.path)
        }

        var url = URL(fileURLWithPath: file, isDirectory: false)
        repeat {
            url = url.deletingLastPathComponent()
            if url.pathComponents.count <= 1 {
                return nil
            }
        } while !isPackageRoot(url)
        return url
    }

    guard let root = packageRoot(of: #file) else {
        fatalError("\(#file) must be contained in a Swift Package Manager project.")
    }
    let fileComponents = URL(fileURLWithPath: #file, isDirectory: false).pathComponents
    let rootComponenets = root.pathComponents
    let trailingComponents = Array(fileComponents.dropFirst(rootComponenets.count))
    let resourceComponents = rootComponenets + trailingComponents[0...1] + ["Resources"]
    return URL(fileURLWithPath: resourceComponents.joined(separator: "/"), isDirectory: true)
}()

extension URL {
    init(forResource name: String, type: String) {
        let url = _resources.appendingPathComponent("\(name).\(type)", isDirectory: false)
        self = url
    }
}
