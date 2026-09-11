//
//  DetailScreenView.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 09/09/26.
//

import SwiftUI

struct DetailScreenView: View {
    @StateObject var vm: DetailScreenViewModel
    
    var body: some View {
        switch vm.stateView {
        case .loading:
            ProgressView()
        case .error(_):
            ErrorSectionView(vm: vm)
        case .content:
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    ImageSectionView(url: vm.getImageURL())
                    
                    HStack {
                        Text(vm.getTitle())
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        if let url = vm.getShowURL() {
                            ShareLink(
                                item: url,
                                subject: Text(vm.getTitle()),
                                message: Text(vm.getSummary())
                            ) {
                                Label("share", systemImage: "square.and.arrow.up")
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    SummarySectionView(summary: vm.getSummary())
                    AverageRatingSectionView(
                        averageRating: vm.getAverageRating(),
                        premiereDate: vm.getPremiereDate()
                    )
                    SeasonSectionView(
                        vm: SeasonSectionViewModel(
                            models: vm.getSeasons()
                        )
                    )
                    
                    EpisodeSectionView(vm: EpisodeSectionViewModel(model: vm.getEpisodes()))
                    
                    CasterSectionView(casters: vm.getCasters())
                }
                .navigationTitle(vm.getTitle())
                .navigationBarTitleDisplayMode(.inline)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    DetailScreenView(vm: DetailScreenViewModel(id: 10))
}
