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
    
    private let expectedURLString = "http://www.apple.com"
    private lazy var expectedURL = URL(string: self.expectedURLString)!
    private lazy var request = URLRequest(url: self.expectedURL)
    
    // MARK: - Test Cases
    
    func test_ExecuteNetworkOperation_WithSuccess() {
        let expectation = XCTestExpectation(description: "Make request with mocked NetworkOperationExecutor. Wait: expected data instance.")
        let expectedData = Data()
        
        let sut = NetworkOperationExecutorMock(data: expectedData)
        let operation = sut.operation(from: request) { (data, response, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(response)
            XCTAssertNil(error)
            XCTAssertEqual(data, expectedData)
            expectation.fulfill()
        }
        
        XCTAssertEqual(operation.state, .running)
        
        wait(for: [expectation], timeout: 0.1)
    }
    
    func test_executeNetworkOperation_WithFailure() {
        let expectation = XCTestExpectation(description: "Make request with mocked NetworkOperationExecutor. Wait: expected error instance.")
        let expectedError: NetworkOperationExecutorMock.Error = .unknown
        
        let sut = NetworkOperationExecutorMock(error: expectedError)
        let operation = sut.operation(from: request) { (data, response, error) in
            XCTAssertNil(data)
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            XCTAssertEqual(error as? NetworkOperationExecutorMock.Error, expectedError)
            expectation.fulfill()
        }
        
        XCTAssertEqual(operation.state, .running)
        
        wait(for: [expectation], timeout: 0.1)
    }
    
}
