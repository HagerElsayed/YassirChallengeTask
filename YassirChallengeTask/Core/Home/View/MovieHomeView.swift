//
//  MovieHomeView.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 20/07/2023.
//

import SwiftUI

struct MovieHomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        allMoviesList
    }
}

extension MovieHomeView {
    private var allMoviesList: some View {
        List {
            ForEach(vm.movies) { movie in
                Text("\(movie.title ?? "")")
            }
        }
        .listStyle(PlainListStyle())
    }
}
struct MovieHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MovieHomeView()
            .environmentObject(developerPreview.homeViewModel)
    }
        
}
