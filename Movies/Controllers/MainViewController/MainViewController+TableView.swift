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
    }
    
    func registerTableCells() {
        self.tableView.register(UINib(
            nibName: MainTableViewCell.nibName,
            bundle: nil
        ), forCellReuseIdentifier: MainTableViewCell.reusableIdentifier)
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
        
        cell.titleLabel.text = "\(indexPath.startIndex)"
        cell.subtitleLabel.text = "iOS feels weird..."
        
        return cell
    }
    
}
