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
    @Published var loadingMovies: Bool = true
    
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
        movieService.fetchTrendingMovies().sink { [weak self] completion in
            self?.loadingMovies = false
        } receiveValue: { [weak self] movies in
            guard let self = self else { return }
            
            self.loadingMovies = false
            
            self.movies = movies
            self.movieEntries = movies.map { MovieCellEntry(
                id: $0.id,
                title: $0.title,
                releaseDate: $0.releaseDate, 
                overview: $0.overview,
                imagePath: $0.posterPath
            ) }
            
            self.downloadImages()
        }.store(in: &subscriptions)
    }
    
    func movieEntry(at indexPath: IndexPath) -> MovieCellEntry? {
        guard indexPath.row >= 0 && indexPath.row < movieEntries.count else {
            return nil
        }
        
        return movieEntries[indexPath.row]
    }
    
    private func downloadImages() {
        for entry in movieEntries {
            movieService.fetchImage(path: entry.imagePath).receive(on: RunLoop.main).sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { data in
                entry.setImage(image: data)
            }.store(in: &subscriptions)
        }
    }
    
}
