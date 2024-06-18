//
//  MainArtistNameCell.swift
//  iTuneArtist
//
//  Created by Kuldeep Singh on 6/12/24.
//

import UIKit

// MARK: Cell class for main Artist view table
class ITuneArtistNameCell: UITableViewCell {
    
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artistSongInfoLabel: UILabel!
    @IBOutlet weak var albumCoverImageView: UIImageView!
    @IBOutlet weak var priceButton: UIButton!
    
    var dataRecieved: ArtistInfo? {
        didSet {
            assignData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        assignData()
    }

}

// MARK: assigning data to the cell
extension ITuneArtistNameCell {
    func assignData() {
//        artistNameLabel.text = "\(dataRecieved?.artistName ?? "")"
//        artistSongInfoLabel.text = "\(Constants.genre.rawValue): \(dataRecieved?.primaryGenreName ?? ""), \(Constants.country.rawValue): \(dataRecieved?.country ?? "")"
        
        artistNameLabel.text = "\(dataRecieved?.trackName ?? "")"
        artistSongInfoLabel.text = "\(dataRecieved?.artistName ?? "")"
        
        if let price = dataRecieved?.collectionPrice {
            priceButton.setBasicBorderStyling(width: 1, radius: 5)
            priceButton.setBasicAttributedTitleStyling(text: "\(price)", fontSize: 12)
        } else {
            priceButton.setTitle(Constants.nA.rawValue, for: .normal)
        }
        
        if let artworkURL = dataRecieved?.artworkUrl60 {
            albumCoverImageView.getImageFromServer(artworkURL: artworkURL)
        }
    }
}
