trix//
//  OMDBViewModel.swift
//  TheOMDBApp
//
//  Created by Pedro Cid on 5/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

import Foundation
import ReactiveCocoa

class OMDBViewModel: ViewModel {
    
    private let apiClient: APIClient
    
    var movie: AnyProperty<DetailViewModel>?{
    
        if let movieModel = _movieModel{
        
            return AnyProperty(movieModel)
        }
        return nil
    }
    
    private var _movieModel: MutableProperty<DetailViewModel>?
    
    init(apiClient: APIClient){
    
        self.apiClient = apiClient
    }
    
    func getMovies(title: String) {
    
        apiClient.getMovieWithTitle(title).map { (movie) -> MovieDetailModel in
            
            return MovieDetailModel(movie: movie)
            
            }.observeOn(UIScheduler()).on(next: {
                self._movieModel?.value = $0
            } ).start()
    
    }
    
    func numberOfMovies() -> Int {
    
        return movie?.value != nil ? 1 : 0
    }
    
    func detailViewModelFirMovieAtIndexPath(indexPath: NSIndexPath) -> DetailViewModel?{
    
        return movie?.value
    }
}