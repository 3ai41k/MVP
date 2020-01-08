//
//  CollectionHeaderView.swift
//  MVP
//
//  Created by Nikita Lizogubov on 08.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    
    // MARK: - Private properties
    private var headerView: HeaderView! {
        didSet {
            headerView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(headerView)
        }
    }
    
    // MARK: - Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initComponents()
    }
    
    // MARK: - Private methods
    private func initComponents() {
        headerView = HeaderView()
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leftAnchor.constraint(equalTo: leftAnchor),
            headerView.rightAnchor.constraint(equalTo: rightAnchor),
            headerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
