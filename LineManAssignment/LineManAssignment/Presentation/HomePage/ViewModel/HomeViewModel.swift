//
//  HomeViewModel.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.

import Foundation
import Combine
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    private let coinUseCase: CoinsUseCaseProtocal = CoinsUseCase()
    private var subscriptions = Set<AnyCancellable>()
    @Published var uiState: UiState = .normal
    @Published var dataClass: DataClass?
    @Published var coins = [Coin]()
    @Published var topCoins = [Coin]()
    @Published var searchCoins: [Coin] = [Coin]()
    @Published var coinDetail:Coin?
    @Published var searchText: String = "" 
    @Published var searchIsActive = false {
        didSet {
            if true {
                uiState = .search
            }
        }
    }
    
    func fatchCoinsList() {
        var x : String?? = .some(nil)

        uiState = .loading
        coinUseCase
            .getCoinList
            .execute()
            .receive(on: DispatchQueue.main)
            .sink {  completion in
                print("comletion Status:",completion)
            } receiveValue: { [weak self]  response in
                self?.coins = response.data?.coins ?? []
                self?.topCoins = response.data?.coins.filter{ $0.rank ?? 5 < 4 } ?? []
                self?.uiState = .normal
            }
        .store(in: &subscriptions)
    }
    func SearchCoinsListBy() {
        searchCoins.removeAll()
        let searchKey = searchText
        if searchKey.isEmpty { return }
        uiState = .loading
        coinUseCase
            .searchCoinsList
            .execute(keyword: searchKey)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                print("comletion Status:",completion)
                switch completion {
                case .finished:
                    self?.uiState = .search
                case .failure:
                    self?.uiState = .error
                }
            } receiveValue: { [weak self]  response in
                self?.searchCoins = response.data?.coins ?? []
                
            }
        .store(in: &subscriptions)
    }
    func GetCoinDetailBy(id: String) {
        uiState = .loading
        coinUseCase
            .getCoinDeatails
            .execute(uuid: id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                print("comletion Status:",completion)
                switch completion {
                case .finished:
                    self?.uiState = .normal
                case .failure:
                    self?.uiState = .error
                }
            } receiveValue: { [weak self]  response in
                
                self?.coinDetail = response.data?.coin ?? nil
            }
        .store(in: &subscriptions)
    }
    func gotWebSite(urlString: String) {
        guard let url = URL(string: urlString) else {
            return 
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    func shareApp(){
        let items: [Any] = ["App name"]
        let activityView = UIActivityViewController(activityItems: items, applicationActivities: nil)
        UIApplication.shared.topViewController()?.present(activityView, animated: true, completion: nil)

    }
    func isAdvertisementIndex(_ index: Int) -> Bool {
            var i = 5
            while i <= index {
                if i == index {
                    return true
                }
                i *= 2
            }
            return false
        }
    
    func formatPrice(_ priceString: String) -> String? {
        guard let price = Double(priceString) else {
            return nil // Return nil if the input string is not a valid number
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        
        var formattedPrice = formatter.string(from: NSNumber(value: price / 1_000_000_000_000))

        
        if let suffix = determineSuffix(price) {
            formattedPrice?.append(" \(suffix)")
        }
        
        return formattedPrice
    }

    func determineSuffix(_ price: Double) -> String? {
        let suffixes = ["trillion", "billion", "million"]
        let thresholds: [Double] = [1_000_000_000_000, 1_000_000_000, 1_000_000]
        
        for (index, threshold) in thresholds.enumerated() {
            if price >= threshold {
                return suffixes[index]
            }
        }
        
        return nil // Return nil if the price is less than a million
    }

}
