//
//  ApplicationCoordinator.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    private let tabBar = UITabBarController()
    
    init(window: UIWindow) {
        self.window = window
        
        initializeTabBarController()
    }
    
    private func initializeTabBarController() {
        let builder = SceneBuilder()
        let controllers = [builder.build(scene: .home),
                           builder.build(scene: .popular),
                           builder.build(scene: .settings)]
        tabBar.viewControllers = controllers
    }
    
    public func setup() {
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
    }
    
}
