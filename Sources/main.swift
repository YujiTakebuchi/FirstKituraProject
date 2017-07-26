import Kitura
import HeliumLogger

// Initialize HeliumLogger
HeliumLogger.use()

// Create a new router
let router = Router()

// Handle HTTP GET requests to /
router.get("/") { request, response, _ in
    response.send("Hello, World!")
}

router.get("/name/:name") { request, response, _ in
    let name = request.parameters["name"] ?? "World"
    response.send("Hello, \(name)!")
}

router.get("/name") { request, response, _ in
    let name = request.queryParameters["name"] ?? "World"
    response.send("Hello, \(name)!")
}

router.get("/todoes") { request, response, _ in
    var todoes = ["swift", "spring", "video game"]
    todoes.append("bicyle")
    for todo in todoes {
        response.send("\(todo)\n")
    }
}

router.get("/index") { request, response, _ in
    do {
        try response.status(.OK)
            .send(fileName: "/Users/chamboo/Products/swift/FirstKituraProject/Sources/index.html").end()
    } catch {
        print("file not found")
    }
}

router.get("/tweet") { request, response, _ in
    do {
        try response.status(.OK)
            .send(fileName: "/Users/chamboo/Products/swift/FirstKituraProject/Sources/posting.html").end()
    } catch {
        print("file not found")
    }
}

router.post("/tweet/post", handler: {request, response, _ in
    
})

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8080, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
