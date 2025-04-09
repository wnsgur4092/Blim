import ProjectDescription

let project = Project(
    name: "Blim",
    targets: [
        .target(
            name: "Blim",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Blim",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Blim/Sources/**"],
            resources: ["Blim/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "BlimTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.BlimTests",
            infoPlist: .default,
            sources: ["Blim/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Blim")]
        ),
    ]
)
