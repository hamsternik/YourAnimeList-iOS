//
//  NetworkService+Errors.swift
//  YourAnimeList-iOS
//
//  Created by Nikita Khomitsevich on 10/20/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import Foundation

extension NetworkService {
    
    enum Error: Swift.Error {
        case clientError
        case serverError
        case unknown
    }
    
}
