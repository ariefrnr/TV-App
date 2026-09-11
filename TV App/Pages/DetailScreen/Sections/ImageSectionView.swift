//
//  ImageSectionView.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

import SwiftUI

struct ImageSectionView: View {
    @StateObject var vm: DetailScreenViewModel
    
    var body: some View {
        if let url = vm.getImageURL() {
            AsyncImage(url: URL(string: url)) { phase in
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
}
