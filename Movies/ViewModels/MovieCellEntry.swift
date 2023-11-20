//
//  MovieCellEntry.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/19/23.
//

import Foundation
import UIKit

class MovieCellEntry {
    
    let id: Int
    let title: String
    let releaseDate: String
    private(set) var image: UIImage?
    
    init(
        id: Int,
        title: String,
        releaseDate: String,
        image: UIImage? = nil
    ) {
        self.id = id
        self.title = title
        self.releaseDate = releaseDate
        self.image = image
    }
    
    public func setImage(image: Data?) {
        guard let imageData = image else {
            return
        }
        self.image = UIImage(data: imageData)
    }
    
}
