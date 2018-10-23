//
//  NetworkOperationExecutorMock.swift
//  YourAnimeListTests
//
//  Created by Nikita Khomitsevich on 10/20/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import Foundation
@testable import YourAnimeList

final class NetworkOperationExecutorMock: NetworkOperationExecutor {
    
    enum Error: Swift.Error {
        case unknown
    }
    
    var data: Data?
    var error: Error?
    
    init(data: Data? = nil, error: Error? = nil) {
        self.data = data
        self.error = error
    }
    
    @discardableResult
    func operation(from request: URLRequest, completion: @escaping (Data?, URLResponse?, Swift.Error?) -> Void) -> NetworkOperation {
        completion(data, nil, error)
        return NetworkOperationMock(state: .running)
    }
    
}
