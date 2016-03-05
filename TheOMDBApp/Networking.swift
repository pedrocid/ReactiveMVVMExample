//
//  Networking.swift
//  DependecyInjection
//
//  Created by Pedro Cid on 4/3/16.
//  Copyright © 2016 Pedro Cid. All rights reserved.
//

//https://github.com/Swinject/SwinjectMVVMExample

import ReactiveCocoa

public protocol Networking {
    func requestJSON(url: String, parameters: [String : AnyObject]?)
        -> SignalProducer<AnyObject, NSError>
}