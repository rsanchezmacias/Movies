//
//  MainViewController+TableView.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/15/23.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        registerTableCells()
        bindViewModelEvents()
    }
    
    func registerTableCells() {
        self.tableView.register(UINib(
            nibName: MainTableViewCell.nibName,
            bundle: nil
        ), forCellReuseIdentifier: MainTableViewCell.reusableIdentifier)
    }
    
    func bindViewModelEvents() {
        self.model.$movies.sink { [weak self] _ in
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }.store(in: &self.subscriptions)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfRows(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reusableIdentifier) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        guard let entry = self.model.movieEntry(at: indexPath) else {
            return UITableViewCell()
        }
        
        cell.setupCell(entry: entry)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellEntry = model.movieEntry(at: indexPath) else {
            return
        }
        
        self.navigateToMovieDetail(movie: cellEntry)
    }
    
}
