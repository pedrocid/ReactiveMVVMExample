//
//  DetailViewModel.swift
//  TheOMDBApp
//
//  Created by Pedro Cid on 5/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

import Foundation
import ReactiveCocoa

protocol DetailViewModel {
    
    var title: MutableProperty<String> { get }
    var plot: MutableProperty<String> { get }
    var year: MutableProperty<String> { get }
    var director: MutableProperty<String> { get }

    func getMovieWithTitle(title: String)
}
