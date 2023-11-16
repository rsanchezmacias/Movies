//
//  MainViewModel.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/15/23.
//

import Foundation

class MainViewModel {
    
    private let movieService: MovieService!
    
    init() {
        movieService = MovieService()
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 10
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func mainViewDidAppear() {
        movieService.fetchTrendingMovies { result in
            switch result {
            case .success(let movies):
                print("Movies total: \(movies.count)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
}
