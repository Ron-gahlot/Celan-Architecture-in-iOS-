//
//  String+extenstion.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 6/4/2567 BE.
//

import Foundation
extension String {
    func getDoublePrice() -> Self{
        if let doubleValue = Double(self) {
            // Format double to display only five decimal places
            let formattedValue = String(format: "%.5f", doubleValue)
           return formattedValue
        } else {
            print("Invalid input") 
        }
        return self 
    }
}
