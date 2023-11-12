//
//  HomeViewModel.swift
//  MusicPlayer
//
//  Created by wilson shakya on 12/11/23.
//

import Foundation

class HomeViewModel {
    
    let neworkHandler: HomeNetworkabHandable
    
    init(networkHandler: HomeNetworkabHandable) {
        self.neworkHandler = networkHandler
    }
    
    convenience init() {
        self.init(networkHandler: HomeNetworkHandler())
    }
    
    func fetchSongs(completion: ([Song]?) -> Void) {
        neworkHandler.fetchSongs(completion: completion)
    }
}
