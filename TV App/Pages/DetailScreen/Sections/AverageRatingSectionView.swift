//
//  AverageRatingSectionView.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

import SwiftUI

struct AverageRatingSectionView: View {
    let averageRating: String
    let premiereDate: String?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Average Rating")
                    .font(.body)
                    .foregroundStyle(.primary)
                    .fontWeight(.semibold)
                
                HStack(spacing: 4) {
                    Text(averageRating)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Image(systemName: "star.fill")
                        .font(.title2)
                }
                
                Text("Premiered at " + (premiereDate ?? "-"))
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
