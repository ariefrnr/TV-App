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
            
            Text("Tidak dapat memuat gambar")
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(width: 210, height: 295)
        .background(.tertiary.opacity(0.3))
    }
}

#Preview {
    ErrorImage()
}
