//
//  CasterSectionView.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

import SwiftUI

struct CasterSectionView: View {
    @StateObject var vm: DetailScreenViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Cast")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            
            if let casters = vm.getCasters() {
                LazyVGrid(columns: columns) {
                    ForEach(casters, id: \.self) { caster in
                        VStack(alignment: .center) {
                            AsyncImage(url: URL(string: caster.imageURL ?? "")) { phase in
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
                            
                            Text(caster.name)
                                .font(.body)
                                .foregroundStyle(.primary)
                                .fontWeight(.regular)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    private let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
}
