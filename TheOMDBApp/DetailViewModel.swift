//
//  DetailViewModel.swift
//  TheOMDBApp
//
//  Created by Pedro Cid on 5/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

import Foundation

protocol DetailViewModel {
    
    var title: String { get }
    var plot: String { get }
    var year: String { get }
    var director: String { get }

}
