//
//  APIError.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//

import Foundation

public enum APIError: Error {
    case failedToMakeURL(String)
    case noCorrectStatusCode(Int?)
    case noResponseData
    case noMultipartFormData
    case noToken
}
