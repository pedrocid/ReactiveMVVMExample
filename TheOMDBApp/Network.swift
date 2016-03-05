//
//  Network.swift
//  DependecyInjection
//
//  Created by Pedro Cid on 4/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

//https://github.com/Swinject/SwinjectMVVMExample

import ReactiveCocoa
import Alamofire

public final class Network: Networking {
    private let queue = dispatch_queue_create(
        "TheOMDBApp.Network.Queue",
        DISPATCH_QUEUE_SERIAL)
    
    public init() { }
    
    public func requestJSON(url: String, parameters: [String : AnyObject]?)
        -> SignalProducer<AnyObject, NSError>
    {
        return SignalProducer { observer, disposable in
            let serializer = Alamofire.Request.JSONResponseSerializer()
            Alamofire.request(.GET, url, parameters: parameters)
                .response(queue: self.queue, responseSerializer: serializer) {
                    response in
                    switch response.result {
                    case .Success(let value):
                        observer.sendNext(value)
                        observer.sendCompleted()
                    case .Failure(let error):
                        observer.sendFailed(error)
                    }
            }
        }
    }
}