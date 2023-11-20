//
//  MovieCellEntry.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/19/23.
//

import Foundation
import UIKit
import Combine

class MovieCellEntry {
    
    let id: Int
    let title: String
    let releaseDate: String
    let overview: String
    let imagePath: String
    
    @Published var image: UIImage?
    
    init(
        id: Int,
        title: String,
        releaseDate: String,
        overview: String,
        imagePath: String,
        image: UIImage? = nil
    ) {
        self.id = id
        self.title = title
        self.releaseDate = releaseDate
        self.overview = overview
        self.imagePath = imagePath
        self.image = image
    }
    
    public func setImage(image: Data?) {
        guard let imageData = image else {
            return
        }
        self.image = UIImage(data: imageData)
    }
    
}
