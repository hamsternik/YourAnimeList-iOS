//
//  NetworkService.swift
//  YourAnimeList-iOS
//
//  Created by Nikita Khomitsevich on 10/18/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import Foundation

final public class NetworkService {
    
    let executor: NetworkOperationExecutor
    
    init(executor: NetworkOperationExecutor = URLSession.shared) {
        self.executor = executor
    }
    
    func execute()
    
}
