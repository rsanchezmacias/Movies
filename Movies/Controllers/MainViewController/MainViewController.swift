//
//  MainViewController.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/15/23.
//

import UIKit

class MainViewController: UIViewController {
    
    static let storyboardName: String = "MainViewController"
    static let identifier: String = "MainViewController"
    
    @IBOutlet weak var tableView: UITableView!
    
    let model = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
    }

}
