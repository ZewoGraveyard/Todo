import Router

public let webApp = Router { route in
    route.resources(path: "/todos", resources: todoResource)
}
