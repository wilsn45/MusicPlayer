//
//  PlayerViewController.swift
//  MusicPlayer
//
//  Created by wilson shakya on 12/11/23.
//

import UIKit
import AVKit
class PlayerViewController: UIViewController {
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var songBanner: UIImageView!
    private var player: AVPlayer? = nil
    
    
    @IBOutlet weak var btnPlay: UIButton!
    
    @IBOutlet weak var btnPause: UIButton!
    
    @IBOutlet weak var btnPrevious: UIButton!
    
    
    @IBOutlet weak var btnNext: UIButton!
    
    var viewModel: PlayerViewModel? = nil
    var playerDelegate: PlayerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title.
        print(viewModel?.song.artistName)
        // Do any additional setup after loading the view.
    }
    
    func playSong() {
        guard let song = viewModel?.song else { return}
        guard let url = URL(string: song.url) else { return }
        let playerItem = AVPlayerItem(url: url)

        self.player =  AVPlayer(playerItem:playerItem)
        player!.volume = 1.0
        player!.play()
    }
        
    
    @IBAction func btnPlayClicked(_ sender: Any) {
        playSong()
    }
    
    @IBAction func btnPausedClicked(_ sender: Any) {
        guard let song = viewModel?.song else { return}
        player?.pause()
    }
    
    @IBAction func btnPreviousClicked(_ sender: Any) {
        guard let song = viewModel?.song else { return}
        playerDelegate?.previous(song: song)
    }
    
    @IBAction func btnNextClicked(_ sender: Any) {
        guard let song = viewModel?.song else { return}
        playerDelegate?.next(song: song)
    }
    
}


protocol PlayerDelegate {
    func next(song: Song)
    func previous(song: Song)
}
