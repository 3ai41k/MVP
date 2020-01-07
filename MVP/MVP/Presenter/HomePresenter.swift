//
//  HomePresenter.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import Foundation

protocol HomeViewProtocol: class {
    
}

protocol HomePresenterProtocol: class {
    init(view: HomeViewProtocol, coordinator: HomeSceneCoordinator)
}

class HomePresenter: HomePresenterProtocol {
    private let view: HomeViewProtocol
    private let coordinator: HomeSceneCoordinator
    
    required init(view: HomeViewProtocol, coordinator: HomeSceneCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }
}
