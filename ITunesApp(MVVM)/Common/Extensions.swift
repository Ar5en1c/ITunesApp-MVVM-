//
//  Extensions.swift
//  iTuneArtist
//
//  Created by Kuldeep Singh on 6/14/24.
//

import Foundation
import UIKit

extension UIButton {
    
    func setBasicBorderStyling(width: Int, radius: Int) {
        self.layer.borderWidth = CGFloat(width)
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.borderColor = UIColor.tintColor.cgColor
    }
    
    func setBasicAttributedTitleStyling(text: String, fontSize: Int) {
        let labelText = "$\(text)"
        let attributedTitle = NSMutableAttributedString(string: labelText)
        let wholeRange = NSRange(location: 0, length: attributedTitle.length)
        attributedTitle.addAttribute(.font, value: UIFont.systemFont(ofSize: CGFloat(fontSize)), range: wholeRange)
        self.setAttributedTitle(attributedTitle, for: .normal)
    }
}


extension UIImageView {
    
    func getImageFromServer(artworkURL: String) {
        ApiClass.shared.fetchImage(from: artworkURL) { [weak self] imageData in
            DispatchQueue.main.async {
                if let data = imageData, let image = UIImage(data: data) {
                    self?.image = image
                } else {
                    self?.image = UIImage(systemName: ErrorMessages.errorImg.rawValue)
                }
            }
        }
    }
}
