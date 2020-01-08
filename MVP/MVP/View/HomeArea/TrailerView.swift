//
//  TrailerView.swift
//  MVP
//
//  Created by Nikita Lizogubov on 08.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit
import AVFoundation

class TrailerView: UIView {
    
    // MARK: - Private properties
    private let films: Array<Film>
    private let videoPlayerView: VideoPlayerView
    @objc private dynamic var queuePlayer: AVQueuePlayer!
    private var tapGestureRecognizer: UITapGestureRecognizer!
    private var lastItemObserver: NSKeyValueObservation?
    private var currentFilmIndex = 0
    
    // MARK: - Public properties
    public var handleTrailerClick: ((_ film: Film) -> Void)?
    public enum PlayerAction {
        case play
        case pause
    }
    public var playerAction: PlayerAction? {
        didSet {
            switch playerAction {
            case .play:
                queuePlayer.play()
            case .pause:
                queuePlayer.pause()
            case .none:
                return
            }
        }
    }
    
    // MARK: - Public methods
    init(films: Array<Film>) {
        self.films = films
        self.videoPlayerView = VideoPlayerView()
        
        super.init(frame: .zero)
        
        setupStyle()
        setupTapGestureRecognizer()
        setupQueuePlayer()
        setupObservation()
        setupPlayerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(videoPlayerView)
        videoPlayerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoPlayerView.topAnchor.constraint(equalTo: topAnchor),
            videoPlayerView.leftAnchor.constraint(equalTo: leftAnchor),
            videoPlayerView.rightAnchor.constraint(equalTo: rightAnchor),
            videoPlayerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Private methods
    private func setupStyle() {
        backgroundColor = .black
        layer.cornerRadius = 5.0
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1.0
        layer.shadowColor = UIColor.systemGray.cgColor
    }
    
    private func setupTapGestureRecognizer() {
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupObservation() {
        lastItemObserver = queuePlayer.observe(\.currentItem, changeHandler: { (player, _) in
            self.currentFilmIndex += 1
            if player.items().count == 1 {
                self.setupQueuePlayer()
                self.currentFilmIndex = 0
            }
        })
    }
    
    private func setupQueuePlayer() {
        let playerItems = films.map({ (film) -> AVPlayerItem in
            let filmURL = film.url
            return AVPlayerItem(url: filmURL)
        })
        queuePlayer = AVQueuePlayer(items: playerItems)
    }
    
    private func setupPlayerView() {
        videoPlayerView.palyer = queuePlayer
        queuePlayer.volume = .zero
    }
    
    // MARK: - Actions
    @objc
    private func didTap(_ sender: Any) {
        let film = films[currentFilmIndex]
        handleTrailerClick?(film)
    }
    
}
