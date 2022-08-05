//
//  AccountSummaryViewControllerTests.swift
//  BankeyTests
//
//  Created by Jean Ricardo Cesca on 03/08/22.
//

import Foundation
import XCTest
@testable import Bankey

class AccountSummaryViewControllerTests: XCTestCase {
    
    var vc: AccountSummaryViewController!
    var mockProfileManager: MockProfileManager!
    
    class MockProfileManager: ProfileManageable {
        var profile: Profile?
        var error: NetworkError?
        
        func fetchProfile(forUserId userId: String, completion: @escaping (Result<Profile, NetworkError>) -> Void) {
            if error != nil {
                completion(.failure(error!))
                return
            }
            profile = Profile(id: "1", firstName: "FirstName", lastName: "LastName")
            completion(.success(profile!))
        }
    }
    
    override func setUp() {
        super.setUp()
        
        //Instanciando as views
        vc = AccountSummaryViewController()
        mockProfileManager = MockProfileManager()
        
        //Injetando a classe fake na oficial
        vc.profileManager = mockProfileManager
    }
    
    func testTitleAndMessageForServerError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .serverError)
        XCTAssertEqual("Server Error", titleAndMessage.0)
        XCTAssertEqual("We could not process your request. Please try again.", titleAndMessage.1)
    }
    
    func testTitleAndMessageForDecodingError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .decodingError)
        XCTAssertEqual("Decoding Error", titleAndMessage.0)
        XCTAssertEqual("Enruse you are connected to the internet. Please try again.", titleAndMessage.1)
    }
    
    func testAlertForServerError() throws {
        mockProfileManager.error = NetworkError.serverError
        vc.forceFetchProfile()
        
        XCTAssertEqual("Server Error", vc.errorAlert.title)
        XCTAssertEqual("We could not process your request. Please try again.", vc.errorAlert.message)
    }
    
    func testAlertForDecodingError() throws {
        mockProfileManager.error = NetworkError.decodingError
        vc.forceFetchProfile()
        
        XCTAssertEqual("Decoding Error", vc.errorAlert.title)
        XCTAssertEqual("Ensure you are connected to the internet. Please try again.", vc.errorAlert.message)
        
    }
    
    
    
    
}
