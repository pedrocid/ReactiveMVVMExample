//
//  APIClient.swift
//  TheOMDBApp
//
//  Created by Pedro Cid on 5/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

import Foundation
import ReactiveCocoa

protocol APIClient{
    func getMovieWithTitle(title: String) -> SignalProducer<Movie,NSError>
}