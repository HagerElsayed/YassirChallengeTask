//
//  View+Extension.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
