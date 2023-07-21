//
//  MainFlow.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 21/07/2023.
//

import SwiftUI

struct MainFlow: View {
    @Namespace private var namespace
    @State private var isDetails = false
    @State var detailData: MovieItem = MovieItem(model: DeveloperPreview.instance.movie)
    @StateObject private var homeViewModel = HomeViewModel()

    var body: some View {
        ZStack {
            if isDetails {
                MovieDetails(namespace: namespace, detailsData: $detailData, isDetails: $isDetails)
            } else {
                MovieHomeView(namespace: namespace, detailsData: $detailData, isDetails: $isDetails)
                    .environmentObject(homeViewModel)
            }
        }
        .background(Color.theme.background)
       
    }
}

struct MainFlow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainFlow()
            MainFlow()
                .preferredColorScheme(.dark)
        }
        
    }
}
