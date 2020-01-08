//
//  ApplicationCoordinator.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

protocol BasicCoordinationProtocol {
    func initializeViewController() -> UIViewController
}

protocol MainCoordinationProtocol {
    associatedtype Destinition
    func coordinate(destinition: Destinition)
}

class AppCoordinator {
    
    private let window: UIWindow
    private var controllers: Array<UIViewController> = Array()
    private let tabBar = UITabBarController()
    
    init(window: UIWindow) {
        self.window = window
        
        initilizeViewControlers()
        initializeTabBarController()
    }
    
    private func initilizeViewControlers() {
        let builder = SceneBuilder()
        let homeViewCoordinator = HomeSceneCoordinator(sceneBuilder: builder)
        let settingsViewCoordinator = SettingsSceneCoordinator(sceneBuilder: builder)
        
        let coordinators: Array<BasicCoordinationProtocol> = [homeViewCoordinator, settingsViewCoordinator]
        controllers = coordinators.map({ $0.initializeViewController() })
    }
    
    private func initializeTabBarController() {
        let filmImage = UIImage(systemName: "film.fill")
        let gearImage = UIImage(systemName: "gear")
        controllers[0].tabBarItem = UITabBarItem(title: "Films", image: filmImage, selectedImage: nil)
        controllers[1].tabBarItem = UITabBarItem(title: "Settings", image: gearImage, selectedImage: nil)
        tabBar.viewControllers = controllers
    }
    
    public func setup() {
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
    }
    
}
