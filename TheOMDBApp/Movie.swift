//
//  Movie.swift
//  TheOMDBApp
//
//  Created by Pedro Cid on 5/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

import Foundation
import Decodable

struct Movie {
    
    let title: String
    let plot: String
    let year: String
    let director: String

}


extension Movie: Decodable{

    static func decode(j: AnyObject) throws -> Movie {
        return try Movie(
            title: j => "Title",
            plot: j => "Plot",
            year: j => "Year",
            director: j => "Director"
        )
    }

}