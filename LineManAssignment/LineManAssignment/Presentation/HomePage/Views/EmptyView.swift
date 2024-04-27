//
//  EmptyView.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 6/4/2567 BE.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Sorry")
            Text("No result match this keyword")
            Spacer()
        }
    }
}

#Preview {
    EmptyView()
}
