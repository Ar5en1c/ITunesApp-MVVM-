//
//  ApiTesting.swift
//  ITunesApp(MVVM)Tests
//
//  Created by Kuldeep Singh on 6/21/24.
//

import XCTest
import UIKit
@testable import ITunesApp_MVVM_

final class ApiTesting: XCTestCase {
    
    var mockApiClass: MockApiClass!
    var mockArtistviewController: MainArtistViewController!
    var mockDataViewModel: ArtistDataViewModel!

    override func setUpWithError() throws {
        mockApiClass = MockApiClass()
        mockArtistviewController = MainArtistViewController()
        mockDataViewModel = ArtistDataViewModel(apiClass: mockApiClass)
        mockArtistviewController.viewModel = mockDataViewModel
        
    }

    override func tearDownWithError() throws {
        mockApiClass = nil
        mockDataViewModel = nil
    }

    func testDataViewModelFetchData() throws {
        mockDataViewModel.fetchData(searchTerm: "dummy")
        XCTAssertEqual(mockDataViewModel.getTotalArtists(), 1, "Expected 1 artist")
        let artistInfo = mockDataViewModel.getArtistInfo(at: 0)
        XCTAssertNotNil(artistInfo, "Artist info should not be nil")
        XCTAssertEqual(artistInfo?.artistName, "Dummyy", "Artist name should match")
    }

}
