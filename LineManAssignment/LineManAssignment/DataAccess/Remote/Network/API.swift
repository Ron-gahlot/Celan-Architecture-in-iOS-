//
//  API.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//

import Alamofire

public protocol API {
    var urlString: String { get }
    var method: HTTPMethod { get }
}

public protocol DataAPI: API {
    var encoding: ParameterEncoding { get }
}
