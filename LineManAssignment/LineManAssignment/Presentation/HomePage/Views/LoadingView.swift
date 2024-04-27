//
//  LoadingView.swift
//  LineManAssignment
//
//  Created by Ron Macbook on 6/4/2567 BE.
//

import SwiftUI

struct LoadingView: View {
    @State var degreesRotating = 0.0
    var body: some View {
        VStack {
            Spacer()
            Image("loadingProgress")
                .font(.system(size: 80))
                .foregroundColor(.blue)
                .rotationEffect(.degrees(degreesRotating))
            
                .onAppear {
                    withAnimation(.linear(duration: 1)
                        .speed(1).repeatForever(autoreverses: false)) {
                            degreesRotating = 360.0
                        }
                }
            Spacer()
        }
    }
}

#Preview {
    LoadingView()
}
