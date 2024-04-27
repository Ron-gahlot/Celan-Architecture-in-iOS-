//
//  CoinDetailResponse.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 6/4/2567 BE.
//

import Foundation
struct CoinDetailResponse: Codable {
    var status: String?
    var data: coinData?
}

struct coinData: Codable {
    var coin: Coin?
}
