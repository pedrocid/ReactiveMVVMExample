//
//  OMDBAPIClient.swift
//  TheOMDBApp
//
//  Created by Pedro Cid on 5/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Result
import Decodable

struct OMDBAPIClient: APIClient {
    
    private let queue = dispatch_queue_create(
        "TheOMDBApp.OMDBAPIClient.Queue",
        DISPATCH_QUEUE_SERIAL)
    
    private let network: Networking
    
    init(network: Networking){
    
        self.network = network
    }
    
    
    func getMovieWithTitle(title: String) -> SignalProducer<Movie,NSError>{
    
        return network.requestJSON(OMDBApiConfig.baseURL, parameters: [OMDBApiConfig.titleParameter:title]).attemptMap({ (json) -> Result<Movie, NSError> in
            
            if let movie = try? Movie.decode(json) {
            
                return Result(value: movie)

            }
            else{
            
                return Result(error: NSError(domain: "", code: 1000, userInfo: nil))

            }
        })

    }
}

struct OMDBApiConfig {
    
    static let baseURL = "http://www.omdbapi.com/"
    static let titleParameter = "t"
    
}