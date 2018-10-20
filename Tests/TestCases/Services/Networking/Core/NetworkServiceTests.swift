//
//  NetworkServiceTests.swift
//  YourAnimeListTests
//
//  Created by Nikita Khomitsevich on 10/20/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import XCTest
@testable import YourAnimeList

final class NetworkServiceTests: XCTestCase {
    
    var sut: NetworkServiceProtocol!
    
    override func setUp() {
        super.setUp()
        sut = NetworkServiceMock()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    // MARK: - Test Cases
    
}
