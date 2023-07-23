//
//  SkeletonView.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 23/07/2023.
//

import SwiftUI

struct SkeletonView: View {
    var height: CGFloat = 20
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(Color.theme.primary.opacity(0.2))
            .frame(height: height)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .animation(.default, value: 8)
    }
}

struct SkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SkeletonView()
                .previewLayout(.sizeThatFits)
            SkeletonView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
            
    }
}
