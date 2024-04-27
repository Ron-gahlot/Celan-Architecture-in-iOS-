//
//  DataClass.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//

import Foundation
struct DataClass: Codable {
    var stats: Stats?
    var coins: [Coin]
}

// MARK: - Coin
struct Coin: Codable {
    var uuid, symbol, name, description: String?
    var color: String?
    var iconURL: String?
    var websiteURL: String?
    var links: [Link]?
    var supply: Supply?
    var numberOfMarkets, numberOfExchanges: Int?
    var the24HVolume, marketCap, fullyDilutedMarketCap, price: String?
    var btcPrice: String?
    var priceAt: Int?
    var change: String?
    var rank: Int?
    var allTimeHigh: AllTimeHigh?
    var coinrankingURL: String?
    var tier: Int?
    var lowVolume: Bool?
    var listedAt: Int?
    var hasContent: Bool?
    var notices: [Notice]?
    var tags: [String]?

    enum CodingKeys: String, CodingKey {
        case uuid, symbol, name, description, color
        case iconURL = "iconUrl"
        case websiteURL = "websiteUrl"
        case links, supply, numberOfMarkets, numberOfExchanges
        case the24HVolume = "24hVolume"
        case marketCap, fullyDilutedMarketCap, price, btcPrice, priceAt, change, rank, allTimeHigh
        case coinrankingURL = "coinrankingUrl"
        case tier, lowVolume, listedAt, hasContent, notices, tags
    }
}

// MARK: - Stats
struct Stats: Codable {
    var total, totalCoins, totalMarkets, totalExchanges: Int?
    var totalMarketCap, total24HVolume: String?

    enum CodingKeys: String, CodingKey {
        case total, totalCoins, totalMarkets, totalExchanges, totalMarketCap
        case total24HVolume = "total24hVolume"
    }
}

// MARK: - AllTimeHigh
struct AllTimeHigh: Codable {
    var price: String?
    var timestamp: Int?
}

// MARK: - Link
struct Link: Codable {
    var name, type: String?
    var url: String?
}

// MARK: - Notice
struct Notice: Codable {
    var type, value: String?
    var date: Int?
}

// MARK: - Supply
struct Supply: Codable {
    var confirmed: Bool?
    var supplyAt: Int?
    var max, total, circulating: String?
}

