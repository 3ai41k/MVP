//
//  HomeSceneCoordinator.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class HomeSceneCoordinator {
    private var navigationController: UINavigationController!
    private let sceneBuilder: HomeSceneBuilderProtocol
    
    init(sceneBuilder: HomeSceneBuilderProtocol) {
        self.sceneBuilder = sceneBuilder
        
        initializeNavigationController()
    }
    
    private func initializeNavigationController() {
        let homeView = sceneBuilder.initializeHomeView(coordinator: self)
        navigationController = UINavigationController(rootViewController: homeView)
    }
    
}

extension HomeSceneCoordinator: BasicCoordinationProtocol {
    func initializeViewController() -> UIViewController {
        return navigationController
    }
    
}

extension HomeSceneCoordinator: MainCoordinationProtocol {
    enum Destinition {
        case productsForAdult
        case productsForChildren
    }
    
    func coordinate(destinition: HomeSceneCoordinator.Destinition) {
        
    }
    
}
