//
//  SearchCoinsListUseCase.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//

import Foundation
import Combine

protocol SearchCoinsListUseCaseProtocal {
    func execute(keyword: String) -> AnyPublisher<CoinsListResponse, Error>
}

class SearchCoinsListUseCase: SearchCoinsListUseCaseProtocal {
     let repo: CoinsReposritryProtocal

    init(repo: CoinsReposritryProtocal) {
        self.repo = repo
    }

    func execute(keyword: String) -> AnyPublisher<CoinsListResponse, Error> {
        return repo.searchCoinsList(keyword: keyword)
    }
}
