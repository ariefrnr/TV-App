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
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: vm.getImageURL())) { phase in
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
            
            VStack(alignment: .leading) {
                Text(vm.getTitle())
                    .font(.headline)
                
                Text("\(vm.getAverageRating())")
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
