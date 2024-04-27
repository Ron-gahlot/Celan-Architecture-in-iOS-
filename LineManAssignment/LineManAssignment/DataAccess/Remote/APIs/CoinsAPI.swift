//
//  CoinsAPI.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//

import Foundation
import Alamofire

enum CoinsAPI: DataAPI {
    case getCoins
    case search(keyword: String)
    case coinDetail(uuid: String)
            
    var urlString: String {
        switch self {
        case .getCoins:
            return "\(BaseURL.api)\(Endpoint.getCoinsList())"
        case .search(let keyword):
            return "\(BaseURL.api)\(Endpoint.getSearchItems(keyword: keyword))"
        case .coinDetail(let uuid):
            return "\(BaseURL.api)\(Endpoint.getCoinDetail(uuid: uuid))"
        }
    }
    
    var method: Alamofire.HTTPMethod {.get}
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
