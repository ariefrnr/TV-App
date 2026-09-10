//
//  SummarySectionView.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

import SwiftUI

struct SummarySectionView: View {
    let summary: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Summary")
                .font(.body)
                .foregroundStyle(.primary)
                .fontWeight(.semibold)
            
            Text(summary)
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal)
    }
}
