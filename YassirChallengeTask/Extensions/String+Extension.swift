//
//  String+Extension.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import Foundation

extension String {
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
    var isBlank: Bool {
        trimmed.isEmpty
    }
    
    var defaultIfEmpty: String {
        isBlank ? "-" : self
    }
}
