//
//  SettingsPresenter.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import Foundation

protocol SettingsViewProtocol: class {
    
}

protocol SettingsPresenterProtocol: class {
    init(view: SettingsViewProtocol, coordinator: SettingsSceneCoordinator)
}

class SettingsPresenter: SettingsPresenterProtocol {
    private let view: SettingsViewProtocol
    private let coordinator: SettingsSceneCoordinator
    
    required init(view: SettingsViewProtocol, coordinator: SettingsSceneCoordinator) {
        self.view = view
        self.coordinator = coordinator
        
    }
}
