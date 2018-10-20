//
//  JikanClient.swift
//  YourAnimeList-iOS
//
//  Created by Nikita Khomitsevich on 10/20/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import Foundation

typealias Identifier = UInt64

final class JikanClient {
    
    private enum Constants {
        static let baseURL = URL(fileURLWithPath: "https://api.jikan.moe/v3")
    }
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getAnime(byID id: Identifier, onSuccess: @escaping (Data) -> Void, onFailure: @escaping (JikanClient.Error) -> Void) -> NetworkOperation {
        let animePathComponent = "anime/{id}"
        let url = Constants.baseURL.appendingPathComponent(animePathComponent)
        let request = URLRequest(url: url)
        
        return networkService.execute(
            request: request,
            onSuccess: { (data) in
                // TODO: API Client could be more sophisticated and pass a parsed model rather than raw data.
                onSuccess(data)
        }, onFailure: { (_) in
            // TODO: Convert raw NetworkClientError on the related with Jikan API error, using JikanClientError.
            onFailure(.unknown(nil))
        })
    }
    
}
