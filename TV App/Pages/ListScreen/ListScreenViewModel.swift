//
//  ListScreenViewModel.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 09/09/26.
//

import SwiftUI
import Combine

class ListScreenViewModel: ObservableObject, TVMazeServiceProtocol {
    @Published var stateView: StateView = .loading
    @Published private(set) var shows: [ShowModel] = []
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    init (service: TVMazeServiceProtocol = TVMazeService()) {
        self.service = service
        self.refresh()
    }
    
    private let service: TVMazeServiceProtocol
}

extension ListScreenViewModel {
    func getShows() async throws -> [ShowModel] {
        do {
            let shows = try await self.service.getShows()
            return shows
        } catch {
            print(error.localizedDescription)
            updateStateView(with: .error(error))
            return []
        }
    }
    
    func getShow(id: Int) async throws -> ShowModel {
        throw URLError(.badURL)
    }
    
    func getEpisodes(id: Int) async throws -> [EpisodeModel] {
        return []
    }
    
    func getSeasons(id: Int) async throws -> [SeasonModel] {
        return []
    }
    
    func getCaster(id: Int) async throws -> [CasterModel] {
        return []
    }
    
    func refresh() {
        Task {
            self.shows = try await self.getShows()
            updateStateView(with: .content)
        }
    }
}

private extension ListScreenViewModel {
    func updateStateView(with state: StateView) {
        DispatchQueue.main.async {
            self.stateView = state
        }
    }
}
