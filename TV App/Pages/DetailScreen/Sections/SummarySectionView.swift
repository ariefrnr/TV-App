//
//  SummarySectionView.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

import SwiftUI

struct SummarySectionView: View {
    @StateObject var vm: DetailScreenViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Summary")
                .font(.body)
                .foregroundStyle(.primary)
                .fontWeight(.semibold)
            
            Text(vm.getSummary())
                .font(.body)
                .foregroundStyle(.secondary)
                .fontWeight(.regular)
        }
        .padding(.horizontal)
    }
}
