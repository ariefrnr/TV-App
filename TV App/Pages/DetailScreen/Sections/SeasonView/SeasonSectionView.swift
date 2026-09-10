//
//  SeasonSectionView.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

import SwiftUI

struct SeasonSectionView: View {
    @StateObject var vm: SeasonSectionViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Seasons")
                .font(.headline)
                .foregroundStyle(.primary)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack {
                    let seasons = vm.getSeasons()
                    
                    ForEach(seasons.indices, id: \.self) { index in
                        let season = seasons[index]
                        
                        VStack {
                            AsyncImage(url: URL(string: season.imageURL ?? "")) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                } else {
                                    ErrorImage()
                                }
                            }
                            
                            Text("Season \(index+1)")
                                .font(.body)
                                .fontWeight(.regular)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
    }
}
