//
//  SettingsNavigationController.swift
//  MVP
//
//  Created by Nikita Lizogubov on 08.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class SettingsNavigationController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
    }
    
    // MARK: - Private methods
    private func setupNavigationController() {
        navigationController?.navigationBar.topItem?.title = "Settings"
    }

}
