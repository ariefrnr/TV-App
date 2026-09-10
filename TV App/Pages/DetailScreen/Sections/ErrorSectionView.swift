//
//  ErrorSectionView.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

import SwiftUI

struct ErrorSectionView: View {
    @StateObject var vm: DetailScreenViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(maxWidth: 64, maxHeight: 64)
                .foregroundStyle(.red)
            
            Text("Unable to load shows")
                .font(.headline)
                .fontWeight(.regular)
                .foregroundStyle(.secondary)
            
            Button {
                vm.refresh()
            } label: {
                Text("Retry")
                    .font(.body)
                    .padding(.horizontal)
            }
            .buttonStyle(.borderedProminent)

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
