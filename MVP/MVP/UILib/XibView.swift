//
//  XibView.swift
//  MVP
//
//  Created by Nikita Lizogubov on 08.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class XibView: UIView {
    
    private var view: UIView! {
        didSet {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initComponents()
    }
    
    private func initComponents() {
        let nibName = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        self.view = view
        
        setupConstarints()
    }
    
    private func setupConstarints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leftAnchor.constraint(equalTo: leftAnchor),
            view.rightAnchor.constraint(equalTo: rightAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
    
}
