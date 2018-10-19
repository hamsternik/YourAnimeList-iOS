//
//  NetworkOperation.swift
//  YourAnimeList-iOS
//
//  Created by Nikita Khomitsevich on 10/18/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import Foundation

typealias NetworkOperation = Cancelable & Resumable & Suspendable & URLSessionTaskState

protocol Cancelable {
    func cancel()
}

protocol Resumable {
    func resume()
}

protocol Suspendable {
    func suspend()
}

protocol URLSessionTaskState {
    var state: URLSessionTask.State { get }
}
