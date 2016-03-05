//
//  MoviesTableViewController.swift
//  TheOMDBApp
//
//  Created by Pedro Cid on 5/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

import UIKit

class MoviesTableViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar! {
    
        didSet{
        
            searchBar.delegate = self
        }
    
    }
    
    @IBOutlet weak var tableView: UITableView! {
    
        didSet{
            
            tableView.dataSource = self
            tableView.delegate = self

        }
    }
    
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        

        setupController()
    }
    
    
    private func setupController(){
    
        self.tableView.register(MovieCell.self)
        
        self.viewModel?.movie?.producer.on(next: { _ in
            self.tableView.reloadData()
        }).start()
        
        

//        self.searchBar.rac_signalForSelector("searchBarTextDidEndEditing:", fromProtocol: UISearchBarDelegate.self).subscribeNext { (searchBar) -> Void in
//            
//            if let searchBar = searchBar as? UISearchBar, let text = searchBar.text{
//                
//                self.viewModel?.getMovies(text)
//            }
//        }
    }
}
extension MoviesTableViewController: UITableViewDataSource{

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel?.numberOfMovies() ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: MovieCell = tableView.dequeueReusableCell(forIndexPath: indexPath)

        if let detailViewModel = self.viewModel?.detailViewModelFirMovieAtIndexPath(indexPath){
        
            cell.setDetailViewModel(detailViewModel)

        }
        
        return cell
    }
    
}

extension MoviesTableViewController: UITableViewDelegate{

    
}

extension MoviesTableViewController: UISearchBarDelegate{

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.viewModel?.getMovies(searchText)
    }

}