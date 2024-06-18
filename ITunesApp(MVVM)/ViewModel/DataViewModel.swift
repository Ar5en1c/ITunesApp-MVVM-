//
//  DataViewModel.swift
//  MVVMPractise
//
//  Created by Kuldeep Singh on 6/14/24.
//

import Foundation

// MARK: - Fetch Data function with Specific Type
class ArtistDataViewModel {
    weak var delegate: ArtistDataDelegate?
    private var artistInfoList: [ArtistInfo] = []
    
    func fetchData(searchTerm: String) {
        // Creating URL based on the searchBar input searchTerm
        let urlString = "\(Constants.iTunesBaseAPIURL.rawValue)\(searchTerm)\(Constants.limit25.rawValue)"
        
        ApiClass.shared.fetchData(url: urlString) { (searchResult: SearchResult?) in
            guard let searchResult = searchResult else {
                print(ErrorMessages.noDataMessage.rawValue)
                return
            }
            
            self.artistInfoList = searchResult.results
            
            DispatchQueue.main.async {
                self.delegate?.didFetchArtistData()
            }
        }
    }
    
    func getTotalArtists() -> Int {
        return artistInfoList.count
    }
    
// Returning the artist info for specific index
    func getArtistInfo(at index: Int) -> ArtistInfo? {
        guard index >= 0 && index < artistInfoList.count else {
            return nil
        }
        return artistInfoList[index]
    }
    
    #if DEBUG
    // This method is for testing purposes to access artistInfoList
    func setArtistInfoListForTesting(_ artistInfoList: [ArtistInfo]) {
        self.artistInfoList = artistInfoList
    }
    #endif
}
