//
//  SettingsSceneCoordinator.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class SettingsSceneCoordinator {
    private var navigationController: UINavigationController!
    private let sceneBuilder: SettingsSceneBuilderProtocol
    
    init(sceneBuilder: SettingsSceneBuilderProtocol) {
        self.sceneBuilder = sceneBuilder
        
        initializeNavigationController()
    }
    
    private func initializeNavigationController() {
        let settingsView = sceneBuilder.initializeSettingsView(coordinator: self)
        navigationController = UINavigationController(rootViewController: settingsView)
    }
    
}

extension SettingsSceneCoordinator: BasicCoordinationProtocol {
    func initializeViewController() -> UIViewController {
        return navigationController
    }
    
}

extension SettingsSceneCoordinator: MainCoordinationProtocol {
    enum Destinition {
        case userInfo
        case logout
    }
    
    func coordinate(destinition: SettingsSceneCoordinator.Destinition) {
        
    }
    
}
