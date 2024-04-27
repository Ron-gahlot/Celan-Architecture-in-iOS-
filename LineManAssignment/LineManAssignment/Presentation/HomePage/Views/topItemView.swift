//
//  topItemView.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 6/4/2567 BE.
//

import SwiftUI
import SDWebImageSwiftUI

struct topItemView: View {
    var imageUrl: String
    var itemName: String
    var itemSymbol: String
    var change: String
    
    var body: some View {
        VStack {
            
            VStack(alignment: .center) {
                WebImage(url: URL(string: imageUrl.replacingOccurrences(of: ".svg", with: ".png")) )
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 10)
                Text(itemName)
                    .font(.system(size: 16))
                    .lineLimit(1)
                Text(itemSymbol)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Spacer()
                    getChangeString(str: change)
                
            }
            .frame(width: (UIScreen.main.bounds.width/3 - 50))
            .padding()
            .background(Color(.cellBackground))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        }
        
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
struct topItemView_Previews: PreviewProvider {
    static var previews: some View {
        topItemView(imageUrl: "searchIcon", itemName: "Bitcoin", itemSymbol: "BTC", change: "8")
    }
}
