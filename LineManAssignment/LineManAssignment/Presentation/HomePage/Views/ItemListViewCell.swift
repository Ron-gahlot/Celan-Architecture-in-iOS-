//
//  ItemListViewCell.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 6/4/2567 BE.
//

import SwiftUI
import SDWebImageSwiftUI

struct ItemListViewCell: View {
    var imageUrl: String
    var itemName: String
    var itemSymbol: String
    var itemPrice: String
    var change: String
 
    var body: some View {
        HStack {
            WebImage(url: URL(string: imageUrl.replacingOccurrences(of: ".svg", with: ".png")) )
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(.trailing, 10)
            HStack {
                VStack(alignment: .leading) {
                    Text(itemName)
                        .font(.system(size: 16))
                        .lineLimit(1)
                        .padding(.vertical, 6)
                    Text(itemSymbol)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                Spacer()
                HStack {
                    VStack (alignment: .trailing){
                        Text("$\(itemPrice.getDoublePrice())")
                            .font(.system(size: 12))
                            .padding(.vertical,6)
                        
                        getChangeString(str: change)
                    }
                }
                .padding(.trailing, 12)
                
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.cellBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
    func getChangeString(str: String) -> some View{
        if str.hasPrefix("-"){
          let newchang = str.replacingOccurrences(of: "-", with: "")
            return Text("↓\(newchang)")
                .font(.system(size: 12))
                .foregroundColor(.red)
                .multilineTextAlignment(.trailing)
                .padding(.leading, 0)
        } else {
            return Text("↑\(str)")
                .font(.system(size: 12))
                .foregroundColor(.green)
                .multilineTextAlignment(.trailing)
                .padding(.leading, 0)
        }
    }
}

struct ItemListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemListViewCell(imageUrl: "photo", itemName: "Bitcoin", itemSymbol: "BTC", itemPrice: "19.99", change: "8")
    }
}
