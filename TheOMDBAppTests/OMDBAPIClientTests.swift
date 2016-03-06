//
//  OMDBAPIClientTests.swift
//  TheOMDBApp
//
//  Created by Pedro Cid on 5/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

import Quick
import Nimble

@testable import TheOMDBApp


class OMDBAPIClientTests: QuickSpec {
    
    
    override func spec(){
    
        describe("test if client returns a Movie"){
        
            context("returns a movie from local json"){
            
                it("returns a movie"){
                
            
                    let networking = StubNetworking()
                    let apiClient: APIClient = OMDBAPIClient(network: networking)
                    var response: Movie?
                    
                    apiClient.getMovieWithTitle("Matrix").on(next: { response = $0 }).start()
                    
                    expect(response).toEventuallyNot(beNil(),timeout: 5)
                    
                }
            }
            
        }
    
        
    }
    
    
}


private class StubNetworking: Networking {
    
    func requestJSON(url: String, parameters: [String : AnyObject]?)
        -> SignalProducer<AnyObject, NSError>{
    
            return SignalProducer { observer, disposable in
            
                observer.sendNext(getMovieJSON())
                observer.sendCompleted()
                
            }
    }
}


private func getMovieJSON() -> [String:AnyObject]{

    return ["Title":"Matrix",
            "Director":"Watchowswki",
            "Year":"1998",
            "Plot":"Wowow"]
    
}