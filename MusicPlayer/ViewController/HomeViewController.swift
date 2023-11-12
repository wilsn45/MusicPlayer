//
//  HomeViewController.swift
//  MusicPlayer
//
//  Created by wilson shakya on 12/11/23.
//

import UIKit
import AVKit
class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = HomeViewModel()
    
    var songsList = [Song]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadSongs()
    }
    
    func loadSongs() {
        viewModel.fetchSongs(completion: {
            songs in
            if let songs = songs  {
                songsList = songs
                print(songsList)
                tableView.reloadData()
            }
           
        })
    }
    
    private func playSong(index: Int) {
        
        let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
        
        guard songsList.indices.contains(index) else { return }
        
        let song = songsList[index]
        playerViewController.viewModel = PlayerViewModel(song: song)
        playerViewController.playerDelegate = self
        self.navigationController?.present(playerViewController, animated: true)
        playerViewController.playSong()
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsList.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let data = songsList[indexPath.row]
        cell.configCell(songName: data.name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playSong(index: indexPath.row)
    }
    
    
}

extension HomeViewController: PlayerDelegate {
    
    func next(song: Song) {
        guard var  index = songsList.firstIndex(where: { $0.name == song.name}) else {
            return
        }
        index = index + 1
        playSong(index: index)
 
    }
    
    func previous(song: Song) {
        guard var  index = songsList.firstIndex(where: { $0.name == song.name}) else {
            return
        }
        index = index - 1
        playSong(index: index)
    }
    
    
}
