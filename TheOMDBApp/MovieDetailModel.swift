//
//  MovieViewModel.swift
//  TheOMDBApp
//
//  Created by Pedro Cid on 5/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

import Foundation
import ReactiveCocoa

class MovieDetailModel: DetailViewModel {
    
    private let apiClient: APIClient

    
    private(set) var title: MutableProperty<String>
    private(set) var plot: MutableProperty<String>
    private(set) var year: MutableProperty<String>
    private(set) var director:MutableProperty<String>

    init(apiClient: APIClient){
        
        self.apiClient = apiClient
        
        self.title = MutableProperty("")
        self.director = MutableProperty("")
        self.year = MutableProperty("")
        self.plot = MutableProperty("")

    }
    
    
    func getMovieWithTitle(title: String){
    
        apiClient.getMovieWithTitle(title).observeOn(UIScheduler()).on(next: { result in
            

            self.title.value = result.title
            self.director.value = result.director
            self.year.value = result.year
            self.plot.value = result.plot

            
            } ).start()

    }

}
