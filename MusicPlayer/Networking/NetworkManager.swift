//
//  NetworkManager.swift
//  MusicPlayer
//
//  Created by wilson shakya on 12/11/23.
//

import Foundation

class NetworkManager {
    
    func makeNetworkRequest(request: URLRequest, respone: @escaping (Result<Data,Error>) -> Void ) {
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: request, completionHandler: {
            data,response,error in
            
            if let error = error {
                respone(.failure(error))
                return
            }
            
            if let data = data {
                respone(.success(data))
            }
            
        })
    }
}


