//
//  BackButton.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import SwiftUI

struct BackButton: View {
    @Binding var isDetails: Bool
    init(
        isDetails: Binding<Bool> = .constant(true)
    ) {
        self._isDetails = isDetails
    }
    var body: some View {
            HStack {
                HStack {
                    Image(systemName: "chevron.backward.2")
                        .font(.title)
                        .foregroundColor(Color.theme.primary)
                        .padding(.horizontal)
                        .padding()
                }
                .background(Color.theme.background)
                .opacity(0.7)
                .cornerRadius(10, corners: [.topRight, .bottomRight])
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.isDetails.toggle()
                    }
                }
                Spacer()
            }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BackButton()
                .previewLayout(.sizeThatFits)
            BackButton()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        
    }
}
