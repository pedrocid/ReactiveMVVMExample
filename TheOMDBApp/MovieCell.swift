//
//  MovieCell.swift
//  TheOMDBApp
//
//  Created by Pedro Cid on 5/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImageVIew: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var moviePlot: UILabel!
}



extension MovieCell{

    func setDetailViewModel(viewModel: DetailViewModel){
    
        movieTitle.text = viewModel.title
        movieYear.text = "\(viewModel.year)"
        movieDirector.text = "\(viewModel.director)"
        moviePlot.text = "\(viewModel.plot)"

    }
}

extension MovieCell: ReusableView{}