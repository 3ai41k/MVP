//
//  TrailerView.swift
//  MVP
//
//  Created by Nikita Lizogubov on 08.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit

class TrailerView: UIView {
    
    private let films: Array<Film>
    private let videoPlayerView = VideoPlayerView()
    
    init(films: Array<Film>) {
        self.films = films
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
