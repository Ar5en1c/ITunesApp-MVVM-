//
//  DataViewModel.swift
//  MVVMPractise
//
//  Created by Kuldeep Singh on 6/14/24.
//

import Foundation


//MARK: Fetch Data function with Specific Type
class ArtistDataViewModel {
    weak var delegate: ArtistDataDelegate?
    private var artistInfoList: [ArtistInfo] = []
    
    func fetchData() {
        ApiClass.shared.fetchData(url: Constants.iTunesAPIURL.rawValue) { (searchResult: SearchResult?) in
            guard let searchResult = searchResult else {
                print(ErrorMessages.noDataMessage.rawValue)
                return
            }
            self.artistInfoList = searchResult.results
            self.delegate?.didFetchArtistData()
        }
    }
    
    func getTotalArtists() -> Int {
        return artistInfoList.count
    }
    
    func getArtistInfo(at index: Int) -> ArtistInfo? {
        guard index >= 0 && index < artistInfoList.count else {
            return nil
        }
        return artistInfoList[index]
    }
    
    // This method is for testing purpose to access artistInfoList
    #if DEBUG
    func setArtistInfoListForTesting(_ artistInfoList: [ArtistInfo]) {
        self.artistInfoList = artistInfoList
    }
    #endif
}
    
