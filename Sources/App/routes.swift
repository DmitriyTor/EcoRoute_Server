import Vapor

func routes(_ app: Application) throws {

    app.get("ping") { _ in
        return "Zdarova, zaebal"
    }
    
    let rootController = RootController()
    
    app.post("sensorCluster") { req in
        return try rootController.cluster(req: req)
    }
 
    app.post("sensors") { req in
        return try rootController.sensors(req: req)
    }
             
    app.post("poi") { req -> EventLoopFuture<[POIModel]> in
        return try rootController.poi(req: req)
    }
}
