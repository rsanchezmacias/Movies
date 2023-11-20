//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/19/23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    static let storyboardName: String = "MovieDetailViewController"
    static let storyboardReference: String = "MovieDetailViewController"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var entry: MovieCellEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        guard let entry = entry else { return }
        titleLabel.text = entry.title
        subtitleLabel.text = entry.releaseDate
        overviewLabel.text = entry.overview
        imageView?.image = entry.image
    }
    
}
