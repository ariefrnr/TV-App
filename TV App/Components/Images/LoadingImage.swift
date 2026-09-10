//
//  LoadingImage.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 09/09/26.
//

import SwiftUI

struct LoadingImage: View {
    var body: some View {
        VStack {
            ProgressView {
                Text("Loading image")
                    .foregroundStyle(.secondary)
            }
        }
        .frame(width: 210, height: 295)
        .background(.secondary.opacity(0.1))
    }
}

#Preview {
    LoadingImage()
}
