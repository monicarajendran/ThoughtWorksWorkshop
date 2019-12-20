//
//  ProductApi.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation
import Moya
import enum Result.Result

enum ProductApi {
    case fetchProductList
}

extension ProductApi: TargetType {
    var baseURL: URL {
        return URL(string: "http://www.mocky.io/v2/5dfb59e72f00006200ff9e80")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}

class ProductService: BaseApiProvider {
    
    var provider: MoyaProvider<ProductApi>
    
    typealias ProductServiceHandler = ((_ data: Data?, _ error: Error?) -> Void)
    
    init(provider: MoyaProvider<ProductApi> = MoyaProvider<ProductApi>()) {
        self.provider = provider
    }
    func fetchProducts(completion: ProductServiceHandler?)  {
        provider.request(.fetchProductList) { (response) in
            let moyaResponse = self.handleResponse(response)
            completion?(moyaResponse.data, moyaResponse.error)
        }
    }
}



