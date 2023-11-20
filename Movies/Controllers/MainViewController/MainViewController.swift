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
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let model = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Movies"
        
        self.setupTableView()
        self.bind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        model.mainViewDidAppear()
    }
    
    private func bind() {
        model.$loadingMovies.receive(on: RunLoop.main).sink { [weak self] loadingMovies in
            if loadingMovies {
                self?.indicator.startAnimating()
                self?.indicator.isHidden = false
            } else {
                self?.indicator.stopAnimating()
                self?.indicator.isHidden = true
            }
        }.store(in: &subscriptions)
    }

}
