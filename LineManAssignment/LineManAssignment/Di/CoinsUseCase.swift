//
//  CoinsUseCase.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//
import Foundation

protocol CoinsUseCaseProtocal: AnyObject {
    var getCoinList: GetCoinsListUseCaseProtocal { get }
    var searchCoinsList: SearchCoinsListUseCaseProtocal { get }
    var getCoinDeatails: GetCoinDetailsUseCaseProtocal { get }
}

class CoinsUseCase: CoinsUseCaseProtocal {

    static let shared = CoinsUseCase()
    
    var getCoinList: any GetCoinsListUseCaseProtocal = GetCoinsListUseCase(repo: CoinsReposritry.shared)
    
    var searchCoinsList: any SearchCoinsListUseCaseProtocal = SearchCoinsListUseCase(repo: CoinsReposritry.shared)
    
    var getCoinDeatails: any GetCoinDetailsUseCaseProtocal = GetCoinDetailsUseCase(repo: CoinsReposritry.shared)
}
