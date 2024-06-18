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
    var viewModel: MockArtistDataViewModel!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "MainArtistViewController") as? MainArtistViewController
        viewController.loadViewIfNeeded()
        
        viewModel = MockArtistDataViewModel()
        viewController.viewModel = viewModel
        viewController.viewModel.delegate = viewController
    }
    
    override func tearDown() {
        viewController = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testLoadData() {
        viewModel.setArtistInfoListForTesting([
            ArtistInfo(artistName: "Test Artist", country: "US", primaryGenreName: "Pop", collectionPrice: 9.99, artworkUrl60: "url")
        ])
        
        viewController.loadData()
        
        XCTAssertEqual(viewModel.getTotalArtists(), 1)
    }
    
    func testDidFetchArtistData() {
        let mockData = [
            ArtistInfo(artistName: "Test Artist1", country: "US", primaryGenreName: "Pop", collectionPrice: 9.99, artworkUrl60: "url"),
            ArtistInfo(artistName: "Test Artist2", country: "US", primaryGenreName: "Pop2", collectionPrice: 9.99, artworkUrl60: "url2")
        ]
        
        viewModel.setArtistInfoListForTesting(mockData)
        viewController.didFetchArtistData()
        
        XCTAssertEqual(viewModel.getTotalArtists(), 2)
        XCTAssertEqual(viewModel.getArtistInfo(at: 0)?.artistName, "Test Artist1")
    }
}

class MockArtistDataViewModel: ArtistDataViewModel {
    override func fetchData() {
        self.delegate?.didFetchArtistData()
    }
}
