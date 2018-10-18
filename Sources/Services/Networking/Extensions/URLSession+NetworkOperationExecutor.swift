//
//  URLSession+NetworkOperationExecutor.swift
//  YourAnimeList-iOS
//
//  Created by Nikita Khomitsevich on 10/18/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import Foundation

extension URLSession: NetworkOperationExecutor {
    
    func operation(from request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkOperation {
        return dataTask(with: request, completionHandler: completion)
    }
    
}
