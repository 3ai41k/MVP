//
//  VideoPlayerView.swift
//  MVP
//
//  Created by Nikita Lizogubov on 08.01.2020.
//  Copyright © 2020 Nikita Lizogubov. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerView: UIView {
    
    private var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    public var palyer: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
    
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
}
