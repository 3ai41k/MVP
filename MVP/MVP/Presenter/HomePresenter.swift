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
}

protocol HomePresenterProtocol: class {
    init(view: HomeViewProtocol, coordinator: HomeSceneCoordinator)
    func fetchFilms()
}

class HomePresenter: HomePresenterProtocol {
    private weak var view: HomeViewProtocol?
    private let coordinator: HomeSceneCoordinator
    
    required init(view: HomeViewProtocol, coordinator: HomeSceneCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }
    
    func fetchFilms() {
        
        let films = [Film(name: "Test1", imageStringURL: "", year: "2000", description: "Test Test Test", raiting: 3),
                     Film(name: "Test2", imageStringURL: "", year: "2001", description: "Test Test Test Test Test Test Test", raiting: 3),
                     Film(name: "Test3", imageStringURL: "", year: "2002", description: "Test Test", raiting: 3),
                     Film(name: "Test4", imageStringURL: "", year: "2010", description: "Test", raiting: 3),
                     Film(name: "Test5", imageStringURL: "", year: "2017", description: "Test Test Test Test Test Test Test Test Test", raiting: 3),]
        
        view?.showFilms(films)
    }
    
}
