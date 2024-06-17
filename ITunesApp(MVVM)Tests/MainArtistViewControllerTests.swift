//
//  ITunesApp_MVVM_Tests.swift
//  ITunesApp(MVVM)Tests
//
//  Created by Kuldeep Singh on 6/14/24.
//

import XCTest
import UIKit
@testable import ITunesApp_MVVM_

class MainArtistViewControllerTests: XCTestCase {
    var viewController: MainArtistViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "MainArtistViewController") as? MainArtistViewController
        viewController.loadViewIfNeeded()
        viewController.viewModel = MockArtistDataViewModel()
        viewController.viewModel.delegate = viewController
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func testLoadData() {
        viewController.loadData()
        XCTAssertEqual(viewController.artistInfoList.count, 1)
    }
    
    func testDidFetchArtistData() {
        let mockData = [ArtistInfo(artistName: "Test Artist", country: "US", primaryGenreName: "Pop", collectionPrice: 9.99, artworkUrl60: "url")]
        
        viewController.didFetchArtistData(mockData)
        
        XCTAssertEqual(viewController.artistInfoList.count, 1)
        XCTAssertEqual(viewController.artistInfoList.first?.artistName, "Test Artist")
    }
}

class MockArtistDataViewModel: ArtistDataViewModel {
    override func fetchData() {
        let mockData = SearchResult(results: [ArtistInfo(artistName: "Test Artist", country: "US", primaryGenreName: "Pop", collectionPrice: 9.99, artworkUrl60: "url")])
        self.delegate?.didFetchArtistData(mockData.results)
    }
}
