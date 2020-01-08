//
//  HomeNavigationController.swift
//  MVP
//
//  Created by Nikita Lizogubov on 08.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class HomeNavigationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationControllerStyle()
        setupTitleView()
        setupNavigatiuonControllerButtons()
    }
    
    private func setupNavigationControllerStyle() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    private func setupTitleView() {
        let titleView = HomeTitleView()
        navigationItem.titleView = titleView
        
        guard let navigationBar = navigationController?.navigationBar else { return }
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.leftAnchor.constraint(equalTo: navigationBar.leftAnchor, constant: 15.0),
            titleView.topAnchor.constraint(equalTo: navigationBar.topAnchor),
            titleView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor)
        ])
    }
    
    private func setupNavigatiuonControllerButtons() {
        let magnifyingGlassImage = UIImage(systemName: "magnifyingglass.circle")
        let searchBarButtonItem = UIBarButtonItem(image: magnifyingGlassImage,
                                                  style: .done,
                                                  target: self,
                                                  action: #selector(didSearch))
        let starImage = UIImage(systemName: "star.circle.fill")
        let topRateButtonItem = UIBarButtonItem(image: starImage,
                                                style: .done,
                                                target: self,
                                                action: #selector(didTopRateFilms))
        
        navigationItem.rightBarButtonItems = [searchBarButtonItem, topRateButtonItem]
    }
    
    @objc
    private func didSearch(_ sender: Any) {
        
    }
    
    @objc
    private func didTopRateFilms(_ sender: Any) {
        
    }

}
