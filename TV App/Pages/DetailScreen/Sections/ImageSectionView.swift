//
//  ImageSectionView.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

import SwiftUI

struct ImageSectionView: View {
    let url: String?
    
    var body: some View {
        AsyncImage(url: URL(string: url ?? "")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if phase.error != nil {
                ErrorImage()
            } else {
                ProgressView()
            }
        }
    }
}
