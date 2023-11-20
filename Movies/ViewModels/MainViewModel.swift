//
//  MainViewModel.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/15/23.
//

import Foundation
import Combine

class MainViewModel {
    
    private let movieService: MovieService!
    private var subscriptions: [AnyCancellable] = []
    
    @Published var movies: [Movie] = []
    @Published var movieEntries: [MovieCellEntry] = []
    
    init() {
        movieService = MovieService()
    }
    
    func numberOfRows(in section: Int) -> Int {
        return self.movies.count
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func mainViewDidAppear() {
        movieService.fetchTrendingMovies().sink { completion in
            // Handle completion or error
        } receiveValue: { [weak self] movies in
            guard let self = self else { return }
            self.movies = movies
            self.movieEntries = movies.map { MovieCellEntry(id: $0.id, title: $0.title, releaseDate: $0.releaseDate) }
        }.store(in: &subscriptions)
    }
    
    func movieEntry(at indexPath: IndexPath) -> MovieCellEntry? {
        guard indexPath.row >= 0 && indexPath.row < movieEntries.count else {
            return nil
        }
        
        return movieEntries[indexPath.row]
    }
    
}
