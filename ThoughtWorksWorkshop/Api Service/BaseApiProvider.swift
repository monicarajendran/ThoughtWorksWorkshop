//
//  BaseApiProvider.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation
import Moya
import enum Result.Result

protocol BaseApiProvider { }

extension BaseApiProvider {
    
    typealias MoyaResponse = (data: Data?, error: Error?)
    
    func handleResponse(_ result: Result<Response, MoyaError>) -> MoyaResponse {
        
        switch result {
            
            case let .success(response):
                do {
                    _ = try response.filterSuccessfulStatusCodes()
                    return (response.data, nil)
                    
                } catch let err {
                    return (nil, err)
            }
            
            case let .failure(error):
                return (nil, error)
        }
    }
}
