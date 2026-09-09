//
//  ErrorImage.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 09/09/26.
//

import SwiftUI

struct ErrorImage: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(maxWidth: 32, maxHeight: 32)
                .foregroundStyle(.secondary)
            
            Text("Image not found")
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 250, maxHeight: .infinity)
        .background(.tertiary.opacity(0.3))
    }
}

#Preview {
    ErrorImage()
}
