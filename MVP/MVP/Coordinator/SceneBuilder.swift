//
//  SceneBuilder.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import Foundation
import UIKit

enum Scene {
    case home
    case settings
    case popular
}

protocol MainSceneBuilderProtocol {
    func build(scene: Scene) -> UIViewController
}

protocol HomeSceneBuilderProtocol {
    func initializeHomeView() -> UIViewController
}

protocol SettingsSceneBuilderProtocol {
    func initializeSettingsView() -> UIViewController
}

protocol PopularSceneBuilderProtocol {
    func initializePopularView() -> UIViewController
}

struct SceneBuilder: MainSceneBuilderProtocol {
    func build(scene: Scene) -> UIViewController {
        switch scene {
        case .home:
            return initializeHomeView()
        case .settings:
            return initializeSettingsView()
        case .popular:
            return initializePopularView()
        }
    }
    
}

extension SceneBuilder: HomeSceneBuilderProtocol {
    func initializeHomeView() -> UIViewController {
        let view = HomeViewController()
        let presenter = HomePresenter(view: view)
        view.presenter = presenter
        return view
    }
    
}

extension SceneBuilder: SettingsSceneBuilderProtocol {
    func initializeSettingsView() -> UIViewController {
        return UIViewController()
    }
    
}

extension SceneBuilder: PopularSceneBuilderProtocol {
    func initializePopularView() -> UIViewController {
        return UIViewController()
    }
    
}


