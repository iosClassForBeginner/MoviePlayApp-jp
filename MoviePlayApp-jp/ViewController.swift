//
//  ViewController.swift
//  MoviePlayApp-jp
//
//  Created by Muneharu Onoue on 2019/01/12.
//  Copyright © 2019年 Muneharu Onoue. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var playerView: UIView!
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        initPlayer()
    }
    
    func initPlayer() {
        let videoUrl = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        player = AVPlayer(url: videoUrl!)
        playerLayer = AVPlayerLayer(player: player)
        playerView.layer.addSublayer(playerLayer)
    }

    override func viewDidLayoutSubviews() {
        playerLayer.frame = playerView.bounds
    }
    
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    
    @IBAction func stop(_ sender: Any) {
        player.pause()
    }

    @IBAction func retry(_ sender: Any) {
        player.seek(to: CMTime.zero)
    }
}

