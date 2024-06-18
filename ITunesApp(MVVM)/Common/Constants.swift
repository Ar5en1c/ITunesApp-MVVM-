//
//  Constants.swift
//  iTuneArtist
//
//  Created by Kuldeep Singh on 6/12/24.
//

import Foundation


//MARK: Consants stored in one place for better management
enum Constants: String {
    case iTunesBaseAPIURL = "https://itunes.apple.com/search?term="
    case limit25 = "&limit=25"
    case artistCellName = "ITuneArtistNameCell"
    case nA = "N/A"
    case genre = "Genre"
    case country = "Country"
}


enum ErrorMessages: String {
    case errorImg = "person.crop.circle.badge.exclamationmark"
    case errorFetchMessage = "Failed to fetch data"
    case noDataMessage = "No Data Available"
    case errorInSerializing = "Unable to convert serialized object to model"
}
