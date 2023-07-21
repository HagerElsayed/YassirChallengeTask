//
//  RoundedCorner.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import SwiftUI
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
