//
//  ViewModel.swift
//  TheOMDBApp
//
//  Created by Pedro Cid on 5/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

import Foundation
import ReactiveCocoa

protocol ViewModel{

    var movie: AnyProperty<DetailViewModel>? { get }

    func getMovies(title: String)
    
    func numberOfMovies() -> Int
    
    func detailViewModelFirMovieAtIndexPath(indexPath: NSIndexPath) -> DetailViewModel?
}