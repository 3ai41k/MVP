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
    init(view: HomeViewProtocol)
}

class HomePresenter: HomePresenterProtocol {
    private let view: HomeViewProtocol
    
    required init(view: HomeViewProtocol) {
        self.view = view
    }
}
