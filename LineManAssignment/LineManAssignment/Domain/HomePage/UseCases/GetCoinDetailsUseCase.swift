//
//  GetCoinDetailsUseCase.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//

import Foundation
import Combine

protocol GetCoinDetailsUseCaseProtocal {
    func execute(uuid: String) -> AnyPublisher<CoinDetailResponse, Error> 
}

class GetCoinDetailsUseCase: GetCoinDetailsUseCaseProtocal {
     let repo: CoinsReposritryProtocal

    init(repo: CoinsReposritryProtocal) {
        self.repo = repo
    }

    func execute(uuid: String) -> AnyPublisher<CoinDetailResponse, Error> {
        return repo.getCoinDetails(uuid: uuid)
    }
}
