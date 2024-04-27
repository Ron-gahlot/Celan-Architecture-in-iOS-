//
//  CoinsReposritry.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//
import Foundation
import Combine

protocol CoinsReposritryProtocal {
    func getCoinsList() -> AnyPublisher<CoinsListResponse, Error>
    func searchCoinsList(keyword: String) -> AnyPublisher<CoinsListResponse, Error>
    func getCoinDetails(uuid: String) -> AnyPublisher<CoinDetailResponse, Error>
}
