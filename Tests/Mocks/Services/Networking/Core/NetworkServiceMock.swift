//
//  NetworkServiceMock.swift
//  YourAnimeList-iOS
//
//  Created by Nikita Khomitsevich on 10/20/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import Foundation
@testable import YourAnimeList

final class NetworkServiceMock: NetworkServiceProtocol {
    
    var data: Data?
    var error: NetworkService.Error?
    
    init(data: Data? = nil, error: NetworkService.Error? = nil) {
        self.data = data
        self.error = error
    }
    
    // TODO: Is correct to test only a NetworkServiceProtocol mocked implementation
    // but without any `executor` as exist in NetworkServiceProtocol existed implementation (look @NetworkService)
    func execute(request: URLRequest, onSuccess: @escaping (Data) -> Void, onFailure: @escaping (NetworkService.Error) -> Void) -> NetworkOperation {
        switch (data, error) {
        case let (data?, _):
            onSuccess(data)
            return NetworkOperationMock(state: .running)
        case let (_, error?):
            onFailure(error)
            return NetworkOperationMock(state: .canceling)
        default:
            return NetworkOperationMock(state: .suspended)
        }
    }
    
}
