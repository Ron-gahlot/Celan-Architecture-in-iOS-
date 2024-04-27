//
//  CoinDetailView.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 6/4/2567 BE.
//

import SwiftUI
import SDWebImageSwiftUI
struct CoinDetailView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                
                WebImage(url: URL(string: viewModel.coinDetail?.iconURL?.replacingOccurrences(of: ".svg", with: ".png") ?? "") )
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.leading, 10)
                    .padding(.trailing, 16)
                VStack(alignment: .leading) {
                    HStack {
                        Text(viewModel.coinDetail?.name ?? "")
                            .foregroundColor(Color(hex: viewModel.coinDetail?.color ?? ""))
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                        Text("(\(viewModel.coinDetail?.symbol ?? ""))")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Text("PRICE")
                            .foregroundColor(Color(hex:"#333333"))
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                        Text("$\(viewModel.coinDetail?.price?.getDoublePrice() ?? "")")
                            .foregroundColor(Color(hex:"#333333"))
                            .font(.system(size: 12))
                    }
                    HStack {
                        Text("MARKET CAP")
                            .foregroundColor(Color(hex:"#333333"))
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                        Text("\(viewModel.formatPrice(viewModel.coinDetail?.marketCap ?? "") ?? "")")
                            .foregroundColor(Color(hex:"#333333"))
                            .font(.system(size: 12))
                    }
                }
                Spacer()
            }
            .padding()
        }
        Text(viewModel.coinDetail?.description ?? "")
            .padding()
            .foregroundColor(Color(hex: "#999999"))
            .font(.system(size: 14))
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
        Divider()
        Button{
            viewModel.gotWebSite(urlString: viewModel.coinDetail?.websiteURL ?? "")
        }label: {
            Text("GO TO WEBSITE")
        }
    }
    
}

#Preview {
    CoinDetailView()
}
