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
                    ImageSectionView(vm: vm)
                    
                    Text(vm.getTitle())
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    SummarySectionView(vm: vm)
                    AverageRatingSectionView(vm: vm)
                    SeasonSectionView(vm: vm)
                    EpisodeSectionView(vm: vm)
                    CasterSectionView(vm: vm)
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
