//
//  DataConstant.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//

import Foundation

public enum BaseURL {
    public static let api: String = "https://api.coinranking.com"
}

public enum Endpoint {
    static let coins: String = "/v2/coins"
    static let coin: String = "/v2/coin"
    static let search: String = "/v2/coins?search="
    
    static func getCoinsList() -> String {
        return "\(coins)"
    }
    static func getCoinDetail(uuid: String) -> String {
        return "\(coin)/\(uuid)"
    }
    static func getSearchItems(keyword: String) -> String {
        return "\(search)\(keyword)"
    }
}
