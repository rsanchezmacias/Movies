//
//  MainViewController.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/15/23.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    static let storyboardName: String = "MainViewController"
    static let identifier: String = "MainViewController"
    
    var subscriptions: [AnyCancellable] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    let model = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        model.mainViewDidAppear()
    }

}
