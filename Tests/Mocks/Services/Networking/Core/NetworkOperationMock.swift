//
//  NetworkOperationMock.swift
//  YourAnimeList
//
//  Created by Nikita Khomitsevich on 10/20/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import Foundation
@testable import YourAnimeList

final class NetworkOperationMock: NetworkOperation {
    
    private var sessionTaskState: URLSessionTask.State
    
    init(state: URLSessionTask.State) {
        sessionTaskState = state
    }
    
    // MARK: - NetworkOperation Interface
    
    func cancel() { sessionTaskState = .canceling }
    
    func resume() { sessionTaskState = .running }
    
    func suspend() { sessionTaskState = .suspended }
    
    var state: URLSessionTask.State { return sessionTaskState }
    
}
