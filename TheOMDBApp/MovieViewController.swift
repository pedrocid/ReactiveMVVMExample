//
//  MoviesTableViewController.swift
//  TheOMDBApp
//
//  Created by Pedro Cid on 5/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

import UIKit
import ReactiveCocoa

class MovieViewController: UIViewController {

    @IBOutlet weak var moviePlot: UITextView!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var searchBar: UISearchBar! {
    
        didSet{
        
            searchBar.delegate = self
        }
    
    }

    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        

        setupController()
    }
    
    
    private func setupController(){
      
        self.viewModel?.title.producer.on(next: { self.movieTitle.text = $0 } ).start()
        self.viewModel?.director.producer.on(next: { self.movieDirector.text = $0 } ).start()
        self.viewModel?.plot.producer.on(next: { self.moviePlot.text = $0 } ).start()
        self.viewModel?.year.producer.on(next: { self.movieYear.text = $0 } ).start()


    }
}



extension MovieViewController: UISearchBarDelegate{

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
     
        self.viewModel?.getMovieWithTitle(searchText)
    }

}