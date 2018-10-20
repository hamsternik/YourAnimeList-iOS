//
//  NetworkOperationExecutorTests.swift
//  YourAnimeListTests
//
//  Created by Nikita Khomitsevich on 10/20/18.
//  Copyright © 2018 Nikita Khomitsevich. All rights reserved.
//

import XCTest
@testable import YourAnimeList

final class NetworkOperationExecutorTests: XCTestCase {
    
    var sut: NetworkOperationExecutor!
    
    override func setUp() {
        super.setUp()
        sut = NetworkOperationExecutorMock()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Test Cases
    
}

