//
//  CoinsReposritry.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//

import Foundation
import Combine

class CoinsReposritry: CoinsReposritryProtocal {

    
  var cancellables = Set<AnyCancellable>()
    
  static let shared = CoinsReposritry()
  let network: NetworkProtocal
    
    
  init(network: NetworkProtocal = Network()) {
        self.network = network
    }
    
    func getCoinsList() -> AnyPublisher<CoinsListResponse, any Error> {
        let api: CoinsAPI = .getCoins
        return network
            .run(api)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    func searchCoinsList(keyword: String) -> AnyPublisher<CoinsListResponse, any Error> {
        let api: CoinsAPI = .search(keyword: keyword)
        return network
            .run(api)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    func getCoinDetails(uuid: String) -> AnyPublisher<CoinDetailResponse, any Error> {
        let api: CoinsAPI = .coinDetail(uuid: uuid)
        return network
            .run(api)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
}
