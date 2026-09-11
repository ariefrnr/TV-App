//
//  AverageRatingSectionView.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

import SwiftUI

struct AverageRatingSectionView: View {
    @StateObject var vm: DetailScreenViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Average Rating")
                    .font(.body)
                    .foregroundStyle(.primary)
                    .fontWeight(.semibold)
                
                HStack(spacing: 4) {
                    Text(vm.getAverageRating())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Image(systemName: "star.fill")
                        .font(.title2)
                }
                
                Text("Premiered at " + vm.getPremiereDate())
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.quaternary)
            .cornerRadius(16)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
