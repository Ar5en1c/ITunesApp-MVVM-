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
    
    func fetchData() {
        ApiClass.shared.fetchData(url: Constants.iTunesAPIURL.rawValue) { (searchResult: SearchResult?) in
            guard let searchResult = searchResult else {
                print(ErrorMessages.noDataMessage.rawValue)
                return
            }
            
            self.delegate?.didFetchArtistData(searchResult.results)
        }
    }
}
