//
//  MovieController.swift
//  MovieListREMAKE
//
//  Created by Jonalynn Masters on 9/13/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import Foundation


class MovieController {
    
    init() {
        loadMoviesInList()
    }
    
    //MARK: - Properties (Movies, defaults, & keys)
    
    var movies: [Movie] = []
    
    let defaults = UserDefaults.standard
    let listKey = "MovieList"
    
    
    
    //MARK: - Movie Functions
    
    func toggleHasSeen(for movie: Movie) {
        guard let index = movies.firstIndex(of: movie) else { return }
        if movies[index].hasSeen == false {
            movies[index].hasSeen = true
        } else if movies[index].hasSeen == true {
            movies[index].hasSeen = false
        }
        saveMoviesInList()
    }
    
    func addMovie(movieTitle: String) {
        let movie = Movie(name: movieTitle)
        movies.append(movie)
        saveMoviesInList()
    }
    
    func deleteMovie(movie: Movie) {
        guard let index = movies.firstIndex(of: movie) else { return }
        movies.remove(at: index)
        saveMoviesInList()
    }
    
    func updateMovie(movie: Movie, title: String) {
        guard let index = movies.firstIndex(of: movie) else { return }
        movies[index].name = title
        saveMoviesInList()
    }
    
    
    // MARK: - Persistence
    
    private func saveMoviesInList() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(movies)
            defaults.set(data, forKey: listKey)
        } catch {
            print("Error: \(error)")
        }
    }
    
    private func loadMoviesInList() {
        guard let data = defaults.data(forKey: listKey) else { return }
        let decoder = PropertyListDecoder()
        do {
            let savedMovies = try decoder.decode([Movie].self, from: data)
            movies = savedMovies
        } catch {
            print("Error: \(error)")
        }
    }
}
