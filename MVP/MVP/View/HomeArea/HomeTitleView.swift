//
//  HomeTitleView.swift
//  MVP
//
//  Created by Nikita Lizogubov on 08.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class HomeTitleView: UIView {
    
    // MARK: - Private properties
    private var titleLabel: UILabel! {
        didSet {
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.text = "Online Movies"
            titleLabel.font = .boldSystemFont(ofSize: 21.0)
            titleLabel.textAlignment = .left
            addSubview(titleLabel)
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
        titleLabel = UILabel()
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
