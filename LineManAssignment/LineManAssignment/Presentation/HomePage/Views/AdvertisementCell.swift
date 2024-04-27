//
//  AdvertisementCell.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 6/4/2567 BE.
//

import SwiftUI

struct AdvertisementCell: View {
    var body: some View {
        HStack {
            Image("gift" )
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(.trailing, 10)
       
            Text("You can earn $10  when you invite a friend to buy crypto. ")
                .font(.system(size: 16)) +
            Text("Invite your friend")
                .font(.system(size: 16))
                .foregroundColor(Color.blue)
        }
        .padding()
        .background(Color(hex: "#C5E6FF"))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
   
}

#Preview {
    AdvertisementCell()
}
