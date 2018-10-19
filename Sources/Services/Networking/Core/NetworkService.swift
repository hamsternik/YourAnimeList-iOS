//
//  NetworkService.swift
//  YourAnimeList-iOS
//
//  Created by Nikita Khomitsevich on 10/18/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import Foundation

final public class NetworkService {
    
    typealias SuccessCompletion = (Data) -> Void
    typealias FailureCompletion = (NetworkServiceError) -> Void
    
    let executor: NetworkOperationExecutor
    
    init(executor: NetworkOperationExecutor = URLSession.shared) {
        self.executor = executor
    }
    
    func execute(request: URLRequest, onSuccess: @escaping SuccessCompletion, onFailure: @escaping FailureCompletion) -> NetworkOperation {
        return executor.operation(from: request) { (data, response, error) in
            // TODO: Should make nil-validation and parse data/response/error.
            onFailure(.unknown)
        }
    }
    
}
