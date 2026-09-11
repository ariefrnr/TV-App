//
//  DetailScreenViewModel.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 09/09/26.
//

import SwiftUI
import Combine

class DetailScreenViewModel: ObservableObject, TVMazeServiceProtocol {
    
    
    @Published var stateView: StateView = .loading
    
    init (id: Int, model: ShowModel? = nil) {
        self.id = id
        self.showModel = model
        self.service = TVMazeService()
        
        if model == nil {
            self.refresh()
        } else {
            updateStateView(with: .content)
        }
    }
    
    private let id: Int
    private let service: TVMazeServiceProtocol
    private var showModel: ShowModel?
    private var seasonSectionModel: [SeasonSectionModel]?
    private var episodeSectionModel: [EpisodeModel]?
    private var casterSectionModel: [CasterSectionModel]?
    private var averageRatingSectionModel: [AverageRatingSectionModel]?
    
    struct SeasonSectionModel: Hashable {
        let id: Int
        let name: String?
        let imageURL: String?
    }
    
    struct EpisodeSectionModel: Hashable, Identifiable {
        let id: Int
        let name: String
        let airdate: String
    }
    
    struct CasterSectionModel: Hashable {
        let name: String
        let imageURL: String?
    }
    
    struct AverageRatingSectionModel {
        let averageRating: String?
        let premiereDate: String?
    }
}

extension DetailScreenViewModel {
    func getShows() async throws -> [ShowModel] {
        return []
    }
    
    func getShow(id: Int) async throws -> ShowModel {
        let show = try await self.service.getShow(id: id)
        return show
    }
    
    func getEpisodes(id: Int) async throws -> [EpisodeModel] {
        let episodes = try await self.service.getEpisodes(id: id)
        return episodes
    }
    
    func getSeasons(id: Int) async throws -> [SeasonModel] {
        let seasons = try await self.service.getSeasons(id: id)
        return seasons
    }
    
    func getCaster(id: Int) async throws -> [CasterModel] {
        let casters = try await self.service.getCaster(id: id)
        return casters
    }
    
    func getImageURL() -> String? { self.showModel?.image?.original }
    func getTitle() -> String { self.showModel?.name ?? "Title not available" }
    func getSummary() -> String { self.showModel?.summary?.strippingHTML() ?? "Summary not available" }
    func getShowURL() -> String? { self.showModel?.url ?? nil }
    func getPremiereDate() -> String { self.showModel?.premiered ?? "Unknown"}
    func getSeasons() -> [SeasonSectionModel]? { self.seasonSectionModel ?? nil }
    func getEpisodes() -> [EpisodeModel]? { self.episodeSectionModel ?? nil }
    func getCasters() -> [CasterSectionModel]? { self.casterSectionModel ?? nil }
    
    func getAverageRating() -> String {
        if let average = self.showModel?.rating?.average {
            return "\(average, default: "%.1f")"
        } else {
            return "No ratings yet"
        }
    }
    
    func refresh() {
        updateStateView(with: .loading)
        
        Task {
            try await self.fetchShow()
            updateStateView(with: .content)
        }
    }
}

private extension DetailScreenViewModel {
    func updateStateView(with state: StateView) {
        DispatchQueue.main.async {
            self.stateView = state
        }
    }
    
    func fetchShow() async throws {
        do {
            let show = try await self.getShow(id: self.id)
            let casters = try await self.getCaster(id: self.id)
            let episodes = try await self.getEpisodes(id: self.id)
            let seasons = try await self.getSeasons(id: self.id)
            
            let listCasters = casters.map { caster in
                CasterSectionModel(
                    name: caster.person?.name ?? "Unknown",
                    imageURL: caster.person?.image?.medium
                )
            }
            
            let listSeasons = seasons.map { season in
                SeasonSectionModel(
                    id: season.id,
                    name: season.name ?? "Unknown",
                    imageURL: season.image?.medium
                )
            }
            
            self.casterSectionModel = listCasters
            self.episodeSectionModel = episodes
            self.seasonSectionModel = listSeasons
            self.showModel = show
        }
        catch {
            print("Fetch Show Error: \(error)")
            updateStateView(with: .error(error))
        }
    }
}

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL."
        case .invalidResponse: return "Failed to receive a valid response from the server."
        }
    }
}

