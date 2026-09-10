//
//  EpisodeSectionView.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

import SwiftUI

struct EpisodeSectionView: View {
    @StateObject var vm: EpisodeSectionViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Episodes")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            
            let episodes = vm.getEpisodes()

            List(episodes.indices, id: \.self) { index in
                let episode = episodes[index]
                
                HStack {
                    // Penomoran dimulai dari 1 (index 0 + 1)
                    Text("\(index + 1).")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundStyle(.primary)
                    
                    Text(episode.name)
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundStyle(.primary)
                    
                    Spacer()
                    
                    Text(episode.airdate)
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundStyle(.primary)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 500)
            .listStyle(.inset)
        }
        .padding(.horizontal)
    }
}

#Preview {
    EpisodeSectionView(
        vm: EpisodeSectionViewModel(
            model: [
                EpisodeSectionModel(
                    id: 1,
                    name: "Test",
                    airdate: "123"
                )
            ]
        )
    )
}
