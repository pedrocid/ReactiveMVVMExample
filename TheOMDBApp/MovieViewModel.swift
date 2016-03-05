//
//  MovieViewModel.swift
//  TheOMDBApp
//
//  Created by Pedro Cid on 5/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

import Foundation
import ReactiveCocoa

struct MovieDetailModel: DetailViewModel {
    
    var title: String
    var plot: String
    var year: String
    var director:String


}

extension MovieDetailModel{

    init(movie: Movie){
    
        title = movie.title
        plot = movie.plot
        year = movie.year
        director = movie.director

    }
}