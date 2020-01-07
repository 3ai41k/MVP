//
//  SceneBuilder.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

protocol HomeSceneBuilderProtocol {
    func initializeHomeView(coordinator: HomeSceneCoordinator) -> UIViewController
}

protocol SettingsSceneBuilderProtocol {
    func initializeSettingsView(coordinator: SettingsSceneCoordinator) -> UIViewController
}

struct SceneBuilder { }

extension SceneBuilder: HomeSceneBuilderProtocol {
    func initializeHomeView(coordinator: HomeSceneCoordinator) -> UIViewController {
        let view = HomeViewController()
        let presenter = HomePresenter(view: view, coordinator: coordinator)
        view.presenter = presenter
        return view
    }
    
}

extension SceneBuilder: SettingsSceneBuilderProtocol {
    func initializeSettingsView(coordinator: SettingsSceneCoordinator) -> UIViewController {
        let view = SettingsViewController()
        let presenter = SettingsPresenter(view: view, coordinator: coordinator)
        view.presenter = presenter
        return view
    }
    
}


