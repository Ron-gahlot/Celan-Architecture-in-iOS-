//
//  GetCoinsListUseCase.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//

import Foundation
import Combine

protocol GetCoinsListUseCaseProtocal {
    func execute() -> AnyPublisher<CoinsListResponse, Error>
}

class GetCoinsListUseCase: GetCoinsListUseCaseProtocal {
     let repo: CoinsReposritryProtocal

    init(repo: CoinsReposritryProtocal) {
        self.repo = repo
    }

    func execute() -> AnyPublisher<CoinsListResponse, Error> {
        return repo.getCoinsList()
    }
}
