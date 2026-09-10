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
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: URL(string: vm.getImageURL())) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ErrorImage()
                    
                    LinearGradient(
                        colors: [.clear, .black.opacity(0.6)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
                Image(systemName: "play.circle.fill")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(12)
            }
            
            VStack(alignment: .leading) {
                Text(vm.getTitle())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)

                HStack(spacing: 4) {
                    Text("\(vm.getAverageRating())")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundStyle(.secondary)

                    Image(systemName: "star.fill")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
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
