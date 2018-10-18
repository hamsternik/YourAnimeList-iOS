//
//  NetworkOperation.swift
//  YourAnimeList-iOS
//
//  Created by Nikita Khomitsevich on 10/18/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import Foundation

protocol NetworkOperation {
    var state: URLSessionTask.State { get }
    
    func cancel()
    func resume()
    func suspend()
}
