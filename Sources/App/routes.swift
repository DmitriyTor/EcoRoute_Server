import Vapor

func routes(_ app: Application) throws {

    app.get("ping") { _ in
        return "Zdarova, zaebal"
    }
    
    let sensorClusterController = SensorClustersController()
    
    app.post("sensorCluster") { req in
        return try sensorClusterController.cluster(req: req)
    }
 
    app.post("sensors") { req in
        return try sensorClusterController.sensors(req: req)
    }
             
    app.post("poi") { req -> EventLoopFuture<String> in
        return try sensorClusterController.poi(req: req)
    }
}
