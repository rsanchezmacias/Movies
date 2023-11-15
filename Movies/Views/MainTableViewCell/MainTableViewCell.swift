//
//  MainTableViewCell.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/15/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let reusableIdentifier: String = "MainTableViewCell"
    static let nibName: String = "MainTableViewCell"
    
    @IBOutlet weak var mainContentView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
}
