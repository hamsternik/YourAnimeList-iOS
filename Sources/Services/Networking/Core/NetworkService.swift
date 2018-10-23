//
//  NetworkService.swift
//  YourAnimeList-iOS
//
//  Created by Nikita Khomitsevich on 10/18/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func execute(request: URLRequest, onSuccess: @escaping (Data) -> Void, onFailure: @escaping (NetworkService.Error) -> Void) -> NetworkOperation
    
}

final public class NetworkService {
    
    let executor: NetworkOperationExecutor
    
    init(executor: NetworkOperationExecutor = URLSession.shared) {
        self.executor = executor
    }
    
    func execute(request: URLRequest, onSuccess: @escaping (Data) -> Void, onFailure: @escaping (NetworkService.Error) -> Void) -> NetworkOperation {
        return executor.operation(from: request) { (data, _, error) in
            switch (data, error) {
            case let (data?, _):
                onSuccess(data)
            case let (_, error?):
                debugPrint(error)
                onFailure(.unknown)
            default:
                break
            }
        }
    }
    
}
