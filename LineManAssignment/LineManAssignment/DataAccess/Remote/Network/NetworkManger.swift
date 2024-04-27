//
//  NetworkManger.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//

import Foundation
import Alamofire

public class NetworkManager {
    public static let shared: NetworkManager = .init()

    let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return Session(configuration: configuration)
    }()
}

