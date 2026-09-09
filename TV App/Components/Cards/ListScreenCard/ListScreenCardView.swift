//
//  ListScreenCardView.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 09/09/26.
//

import SwiftUI

struct ListScreenCardView: View {
    @StateObject var vm: ListScreenCardViewModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: vm.getImageURL())) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(maxWidth: 210, maxHeight: 295)
                        .aspectRatio(contentMode: .fit)
                } else if phase.error != nil {
                    ErrorImage()
                } else {
                    ProgressView()
                }
            }
            
            VStack {
                Text(vm.getTitle())
                    .font(.headline)
                
                Text(vm.getAverageRating())
                    .font(.body)
            }
            .padding(.vertical, 4)
        }
    }
}


#Preview {
    ListScreenCardView(
        vm: ListScreenCardViewModel(
            model: ListScreenCardModel(
                imageURL: "https://placehold.co/210x295/png",
                title: "Good Time",
                rating: 0
            )
        )
    )
}
