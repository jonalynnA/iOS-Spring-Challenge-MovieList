//
//  MoviesTableViewController.swift
//  MovieListREMAKE
//
//  Created by Jonalynn Masters on 9/13/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import UIKit

class MoviesTableViewController: UIViewController {
    
    
    
    
    let movieController = MovieController()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.reloadData()
        title = "Movie List"
        tableView.tableFooterView = UIView()
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1177810126, green: 0.1257176072, blue: 0.1434536638, alpha: 1)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAddMovieSegue"{
            guard let addMovieVC = segue.destination as? AddMovieViewController else { return }
            addMovieVC.movieController = movieController
        }
    }
}



extension MoviesTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieController.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        let movie = movieController.movies[indexPath.row]
        cell.movie = movie
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            movieController.movies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension MoviesTableViewController: MovieTableViewCellDelegate {
    func editName(of movie: Movie, to newTitle: String) {
        guard let index = movieController.movies.firstIndex(of: movie) else { return }
        movieController.updateMovie(movie: movie, title: newTitle)
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    func seenButtonTapped(on cell: MovieTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let movie = movieController.movies[indexPath.row]
        movieController.toggleHasSeen(for: movie)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
