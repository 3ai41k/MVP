//
//  HomePresenter.swift
//  MVP
//
//  Created by Nikita Lizogubov on 07.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import Foundation

protocol HomeViewProtocol: class {
    func showFilms(_ films: Array<Film>)
    func showError(_ description: String)
}

protocol HomePresenterProtocol: class {
    init(view: HomeViewProtocol, coordinator: HomeSceneCoordinator, dataService: DataService)
    func fetchFilms()
}

class HomePresenter: HomePresenterProtocol {
    private weak var view: HomeViewProtocol?
    private let coordinator: HomeSceneCoordinator
    private let dataService: DataService
    
    required init(view: HomeViewProtocol, coordinator: HomeSceneCoordinator, dataService: DataService) {
        self.view = view
        self.coordinator = coordinator
        self.dataService = dataService
    }
    
    func fetchFilms() {
        dataService.getFilms { (result) in
            switch result {
            case .success(let films):
                view?.showFilms(films)
            case .failure(let error):
                let description = error.localizedDescription
                view?.showError(description)
            }
        }
    }
    
}
