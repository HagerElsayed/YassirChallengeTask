//
//  WelcomeView.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 22/07/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text("Hi,")
                    .foregroundColor(Color.theme.primary)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("let's pick your next Movie")
                    .foregroundColor(Color.theme.secondaryText)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding(30)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WelcomeView()
                .previewLayout(.sizeThatFits)
            WelcomeView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
