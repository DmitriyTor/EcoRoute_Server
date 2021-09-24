import Vapor

func routes(_ app: Application) throws {

    let sensorClusterController = SensorClusters()
    app.post("sensorCluster") { req in
        return try sensorClusterController.cluster(req: req)
    }
    
    app.post("sensorClusterTest") { req in
        return try sensorClusterController.test1(req: req)
    }
    
    app.post("sensorsTest") { req -> String in
        return try sensorClusterController.test(req: req)
    }
}
