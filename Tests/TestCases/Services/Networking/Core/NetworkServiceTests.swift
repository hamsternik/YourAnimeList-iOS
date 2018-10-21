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
    
    private let expectedURLString = "http://www.apple.com"
    private lazy var expectedURL = URL(string: self.expectedURLString)!
    private lazy var request = URLRequest(url: self.expectedURL)
    
    // MARK: - Test Cases
    
    func test_requestOperationExecution_withSuspendedState() {
        let sut: NetworkServiceProtocol = NetworkServiceMock()
        let operation = sut.execute(
            request: request,
            onSuccess: { _ in },
            onFailure: { _ in }
        )
        
        XCTAssertEqual(operation.state, .suspended)
    }
    
    func test_requestOperationExecution_SuccessExecution_withRunningState() {
        let expectation = XCTestExpectation(description: "Make request with mocked NetworkService. Wait: expected data instance.")
        let expectedData = Data()
        
        let sut: NetworkServiceProtocol = NetworkServiceMock(data: expectedData)
        let operation = sut.execute(
            request: request,
            onSuccess: { data in
                XCTAssertEqual(data, expectedData)
                expectation.fulfill()
        },
            onFailure: { _ in }
        )
        
        wait(for: [expectation], timeout: 0.1)
        
        XCTAssertEqual(operation.state, .running)
    }
    
    func test_requestOperationExecution_FailureExecution_withCancelingState() {
        let expectation = XCTestExpectation(description: "Make request with mocked NetworkService. Wait: expected data instance.")
        let expectedError: NetworkService.Error = .unknown
        
        let sut: NetworkServiceProtocol = NetworkServiceMock(error: expectedError)
        let operation = sut.execute(
            request: request,
            onSuccess: { _ in },
            onFailure: { error in
                XCTAssertEqual(error, expectedError)
                expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 0.1)
        
        XCTAssertEqual(operation.state, .canceling)
    }
    
}
