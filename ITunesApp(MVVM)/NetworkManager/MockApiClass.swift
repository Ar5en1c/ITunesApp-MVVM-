//
//  MockApiClass.swift
//  ITunesApp(MVVM)
//
//  Created by Kuldeep Singh on 6/21/24.
//

import Foundation

//MARK: Mock API class
class MockApiClass: ApiClass {

    // MARK: Mock Fetch Data function for testing
    override func fetchData<T : Codable>(url: String, completion: @escaping (T?) -> ()) {
        
        let mockArtistData = [ArtistInfo(artistName: "Dummyy", country: "Again", primaryGenreName: "Dummy", collectionPrice: 99.9, artworkUrl60: "https:myurl.com", trackName: "NoName")]
        let mockResult: SearchResult = SearchResult(results: mockArtistData)
        completion(mockResult as? T)
    }
}
