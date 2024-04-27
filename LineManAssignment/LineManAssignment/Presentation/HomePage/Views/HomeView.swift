//
//  HomeView.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 5/4/2567 BE.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var searchText = ""
    @State var showCoinDetail = false
    @State private var sheetHeight: CGFloat = .zero
    
    var body: some View {
        NavigationStack {
            searchTextFiled
            switch viewModel.uiState {
            case .normal:
                listView
                    .listStyle(.plain)
            case .search:
                if viewModel.searchCoins.count == 0 {
                    EmptyView()
                } else {
                    SearchView
                        .listStyle(.plain)
                }
            case .error:
                ErrorView()
            case .loading:
                LoadingView()
            }
               }
        .sheet(isPresented: $showCoinDetail, content: {
            CoinDetailView()
                .environmentObject(viewModel)
                .overlay {
                                GeometryReader { geometry in
                                    Color.clear.preference(key: InnerHeightPreferenceKey.self, value: geometry.size.height)
                                }
                            }
                            .onPreferenceChange(InnerHeightPreferenceKey.self) { newHeight in
                                sheetHeight = newHeight
                            }
                            .presentationDetents([.height(sheetHeight)])
        })
        .onAppear{
            viewModel.fatchCoinsList()
        }
    }
        
}


extension HomeView {
    private var listView: some View {
        List {
            Text("Top 3 rank crypto")
            HStack {
                ForEach(viewModel.topCoins, id: \.btcPrice) { item in
                    topItemView(imageUrl: item.iconURL ?? "", itemName: item.name ?? "", itemSymbol: item.symbol ?? "" , change: item.change ?? "")
                        .fixedSize(horizontal: true, vertical: true)
                        .frame(maxWidth: .infinity)
                }
            }
            .listRowSeparator(.hidden)
            
            Text("Buy, sell and hold crypto")
            ForEach(Array(viewModel.coins.enumerated()), id: \.element.name) { (index, coin) in
                let item = coin
                if viewModel.isAdvertisementIndex(index) {
                    AdvertisementCell()
                        .onTapGesture {
                            viewModel.shareApp()
                        }
                }
                ItemListViewCell(imageUrl: item.iconURL ?? "", itemName: item.name ?? "", itemSymbol: item.symbol ?? "" , itemPrice: item.price ?? "", change: item.change ?? "")
                    .onTapGesture {
                        didTapOnRow(coin: item)
                    }
                    .listRowSeparator(.hidden)
            }
        }
        .refreshable {
            viewModel.fatchCoinsList()
        }
    }
    func didTapOnRow(coin: Coin) {
        viewModel.GetCoinDetailBy(id: coin.uuid ?? "")
        showCoinDetail = true
    }
}
extension HomeView {
    private var SearchView: some View {
        List {
            ForEach(viewModel.searchCoins, id: \.btcPrice) { item in
                
                ItemListViewCell(imageUrl: item.iconURL ?? "", itemName: item.name ?? "", itemSymbol: item.symbol ?? "" , itemPrice: item.price ?? "", change: item.change ?? "")
                    .listRowSeparator(.hidden)
            }
        }
        .refreshable {
            viewModel.SearchCoinsListBy()
        }
    }
}
extension HomeView {
    private var searchTextFiled: some View {
        VStack(alignment: .center, spacing: 16) {
            HStack(alignment: .center, spacing: 12) {
                HStack {
                    Image("searchIcon")
                        .frame(width: 24, height: 24)
                    TextField("Search", text: $viewModel.searchText)
                        .font(.system(size: 16))
                        .onReceive(
                            viewModel.$searchText
                                .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
                        ) {
                            guard !$0.isEmpty else { return }
                            viewModel.uiState = .search
                            viewModel.SearchCoinsListBy()
                        }
                        .onChange(of: viewModel.searchText, { oldValue, newValue in
                                if newValue.count == 0 {
                                    viewModel.uiState = .normal
                                    viewModel.searchCoins.removeAll()
                                }
                        })
                        .foregroundColor(.black)
                    Button(action: {
                        viewModel.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 8)
                .padding(.trailing, 16)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.cellBackground)
                .cornerRadius(20)
                
            }
            .padding(.leading, 16)
            .padding(.trailing, 12)
        }
        .padding(.horizontal, 0)
        .padding(.top, 0)
        .padding(.bottom, 16)
        .background(.white.opacity(0.8))
    }
}
#Preview {
    HomeView()
}
struct InnerHeightPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
