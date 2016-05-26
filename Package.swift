import PackageDescription

let package = Package(
    name: "Todo",
    targets: [
        Target(
            name: "TodoServer",
            dependencies: [
                .Target(name: "TodoWeb"),
            ]
        ),
        Target(
            name: "TodoWeb",
            dependencies: [
                .Target(name: "TodoApplication"),
                .Target(name: "TodoStore"),
                .Target(name: "TodoMapping"),
            ]
        ),
        Target(
            name: "TodoMapping",
            dependencies: [
                .Target(name: "TodoDomain"),
            ]
        ),
        Target(
            name: "TodoStore",
            dependencies: [
                .Target(name: "TodoApplication"),
            ]
        ),
        Target(
            name: "TodoApplication",
            dependencies: [
                .Target(name: "TodoDomain"),
            ]
        ),
        Target(name: "TodoDomain"),
    ],
    dependencies: [
        .Package(url: "https://github.com/Zewo/Zewo.git", majorVersion: 0, minor: 5),
        .Package(url: "https://github.com/Zewo/Resource.git", majorVersion: 0, minor: 5),
    ]
)
