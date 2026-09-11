//
//  ListScreenView.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 09/09/26.
//

import SwiftUI

struct ListScreenView: View {
    @StateObject var vm: ListScreenViewModel
    
    var body: some View {
        switch vm.stateView {
        case .loading:
            ProgressView()
        case .error(_):
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
        case .content:
            ScrollView {
                LazyVGrid(columns: vm.columns) {
                    ForEach(vm.shows, id: \.self) { data in
                        NavigationLink {
                            DetailScreenView(vm: DetailScreenViewModel(id: data.id))
                        } label: {
                            ListScreenCardView(vm:
                                ListScreenCardViewModel(
                                    model: ListScreenCardModel(
                                        imageURL: data.image?.medium,
                                        title: data.name ?? "Unknown",
                                        rating: data.rating?.average
                                    )
                                )
                            )
                        }
                        .buttonStyle(.plain)

                    }
                }
                .padding()
                .navigationTitle("Discover")
            }
        }
    }
}

#Preview {
    ListScreenView(vm: ListScreenViewModel())
}
