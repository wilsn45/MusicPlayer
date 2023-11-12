//
//  HomeNetworkHandler.swift
//  MusicPlayer
//
//  Created by wilson shakya on 12/11/23.
//

import Foundation

protocol HomeNetworkabHandable {
    func fetchSongs(completion: ([Song]?) -> Void)
}

class HomeNetworkHandler: HomeNetworkabHandable {
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    convenience init() {
        self.init(networkManager: NetworkManager())
    }
    
    func fetchSongs(completion: ([Song]?) -> Void) {
        
        let song1 = Song(name: "Numb", artistName: "Linkin Park", url: "http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3")
        let song2 = Song(name: "Moves Like Jagger", artistName: "Maroon 5", url: "http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Sevish_-__nbsp_.mp3")
        let song3 = Song(name: "Believer", artistName: "Imagine Dragons", url: "http://codeskulptor-demos.commondatastorage.googleapis.com/GalaxyInvaders/theme_01.mp3")
        
        let songs = [song1,song2,song3]
        
        completion(songs)
        
        return
        
        let stringUrl = HomeServerURLRepository.loadURL
        
        guard let url = URL(string: stringUrl) else {
            completion(nil)
        }
        
        let urlRequest = URLRequest(url: url)
        
//        networkManager.makeNetworkRequest(request: urlRequest, respone: {
//            result in
//            
//            switch result {
//            case .success(let data):
//                let songs = JSONDecoder().decode([Song.self], from: data)
//                completion(songs)
//            case .failure(let error):
//                completion(nil)
//            }
//            
//        })
    }
    
}


struct Song: Decodable {
    let name: String
    let artistName: String
    let url: String 
}


