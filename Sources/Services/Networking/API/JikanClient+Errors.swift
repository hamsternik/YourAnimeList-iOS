//
//  JikanClient+Errors.swift
//  YourAnimeList-iOS
//
//  Created by Nikita Khomitsevich on 10/20/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import Foundation

extension JikanClient {
    
    enum Error: Swift.Error {
        case parsingError
        case unknown(String?)
    }
    
}
