//
//  MainTableViewCell.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/15/23.
//

import UIKit
import Combine

class MainTableViewCell: UITableViewCell {
    
    static let reusableIdentifier: String = "MainTableViewCell"
    static let nibName: String = "MainTableViewCell"
    
    @IBOutlet weak var mainContentView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    var imageSubscription: AnyCancellable?
    
    func setupCell(entry: MovieCellEntry) {
        imageSubscription?.cancel()
        
        titleLabel.text = entry.title
        subtitleLabel.text = entry.releaseDate
        
        imageSubscription = entry.$image.sink(receiveValue: { [weak self] image in
            self?.coverImageView.image = image
        })
    }
    
}
