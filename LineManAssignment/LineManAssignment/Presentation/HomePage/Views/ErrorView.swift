//
//  ErrorView.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 6/4/2567 BE.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Could not load data ")
            Text("You've reached the API request limit")
            Spacer()
        }
    }
}

#Preview {
    ErrorView()
}
