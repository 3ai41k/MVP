//
//  HomeSceneCoordinator.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit
import AVKit

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
        case playFilm(_ film: Film)
    }
    
    func coordinate(destinition: HomeSceneCoordinator.Destinition) {
        switch destinition {
        case .playFilm(let film):
            presentVideoPlayer(withFilm: film)
        }
    }
    
    private func presentVideoPlayer(withFilm film: Film) {
        let filmURL = film.url
        let player = AVPlayer(url: filmURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.modalPresentationStyle = .fullScreen
        navigationController.present(playerViewController, animated: true) {
            player.play()
        }
    }
    
}
