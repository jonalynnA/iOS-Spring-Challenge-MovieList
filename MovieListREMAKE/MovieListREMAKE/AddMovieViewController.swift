//
//  AddMovieViewController.swift
//  MovieListREMAKE
//
//  Created by Jonalynn Masters on 9/13/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {

    var movieController: MovieController?
    
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var movieTextField: UITextField!
    @IBOutlet weak var addMovieButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Movie"
        addMovieButton.backgroundColor = #colorLiteral(red: 0.2414570153, green: 0.251044631, blue: 0.2682756484, alpha: 1)
        addMovieButton.tintColor = .green
        addMovieButton.layer.cornerRadius = 20
        
    }
    
    
    
    @IBAction func addMovieButtonTapped(_ sender: UIButton) {
        guard let movieTitle = movieTextField.text,
            let movieController = movieController else { return }
        movieController.addMovie(movieTitle: movieTitle)
        self.navigationController?.popToRootViewController(animated: true)
    }

}

