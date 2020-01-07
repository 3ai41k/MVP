//
//  HomeViewController.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    public weak var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension HomeViewController: HomeViewProtocol {
    
}
