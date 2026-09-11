//
//  DetailScreenViewModel.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 09/09/26.
//

import SwiftUI
import Combine

enum DetailScreenStateView {
    case loading
    case content
    case error(Error)
}

class DetailScreenViewModel: ObservableObject {
    @Published var stateView: DetailScreenStateView = .loading
//    @Published private var seasonCardModel: [SeasonCardModel]?
    
    init (id: Int, model: ShowModel? = nil, seasonCardModel: [SeasonCardModel]? = nil) {
        self.id = id
        self.model = model
        self.seasonCardModel = seasonCardModel
        
        if model == nil {
            Task {
                await self.fetchShow()
                updateStateView(with: .content)
            }
            
            
        } else {
            updateStateView(with: .content)
        }
    }
    
    private let id: Int
    private var model: ShowModel?
    private var seasonCardModel: [SeasonCardModel]?
    private var episodeSectionModel: [EpisodeSectionModel]?
    private var casterSectionModel: [CasterSectionModel]?
    private var averageRatingSectionModel: [AverageRatingSectionModel]?
}

extension DetailScreenViewModel {
    func getImageURL() -> String? { self.model?.image?.original }
    func getTitle() -> String { self.model?.name ?? "Title not available" }
    func getSummary() -> String { self.model?.summary?.strippingHTML() ?? "Summary not available" }
    func getPremiereDate() -> String { self.model?.premiered ?? "Unknown"}
    func getSeasons() -> [SeasonCardModel] { return self.seasonCardModel ?? [] }
    func getEpisodes() -> [EpisodeSectionModel] { return self.episodeSectionModel ?? [] }
    func getCasters() -> [CasterSectionModel] { return self.casterSectionModel ?? [] }
    
    func getAverageRating() -> String {
        if let average = self.model?.rating?.average {
            return "\(average, default: "%.1f")"
        } else {
            return "No ratings yet"
        }
    }
    
    func refresh() {
        updateStateView(with: .loading)
        
        Task {
            await self.fetchShow()
            updateStateView(with: .content)
        }
    }
}

private extension DetailScreenViewModel {
    func updateStateView(with state: DetailScreenStateView) {
        DispatchQueue.main.async {
            self.stateView = state
        }
    }
    
    func fetchShow() async {
        guard let showURL = URL(string: "\(Environment.apiUrl)shows/\(self.id)"),
              let seasonURL = URL(string: "\(Environment.apiUrl)shows/\(self.id)/seasons"),
              let episodeURL = URL(string: "\(Environment.apiUrl)shows/\(self.id)/episodes"),
              let casterURL = URL(string: "\(Environment.apiUrl)shows/\(self.id)/cast")
        else {
            updateStateView(with: .error(NetworkError.invalidURL))
            return
        }
        
        do {
            async let (showData, showResponse) = URLSession.shared.data(from: showURL)
            async let (seasonData, seasonResponse) = URLSession.shared.data(from: seasonURL)
            async let (episodeData, episodeResponse) = URLSession.shared.data(from: episodeURL)
            async let (casterData, casterResponse) = URLSession.shared.data(from: casterURL)
            
            let (sData, sResp) = try await (showData, showResponse)
            let (seData, seResp) = try await (seasonData, seasonResponse)
            let (epData, epResp) = try await (episodeData, episodeResponse)
            let (casData, casResp) = try await (casterData, casterResponse)
            
            try validateHTTPResponse(sResp)
            try validateHTTPResponse(seResp)
            try validateHTTPResponse(epResp)
            try validateHTTPResponse(casResp)
            
            let decoder = JSONDecoder()
            let show = try decoder.decode(ShowModel.self, from: sData)
            let seasons = try decoder.decode([SeasonModel].self, from: seData)
            let episodes = try decoder.decode([EpisodeModel].self, from: epData)
            let casters = try decoder.decode([CasterModel].self, from: casData)
            
            let listCasters = casters.map { caster in
                CasterSectionModel(
                    name: caster.person?.name ?? "Unknown",
                    imageURL: caster.person?.image?.medium
                )
            }
            
            let listEpisodes = episodes.map { episode in
                EpisodeSectionModel(
                    id: episode.id,
                    name: (episode.name == "" ? "Unknown" : episode.name) ?? "Unknown",
                    airdate: episode.airdate ?? "-"
                )
            }
            
            let listSeasons = seasons.map { season in
                SeasonCardModel(
                    id: season.id,
                    name: season.name ?? "Unknown",
                    imageURL: season.image?.medium
                )
            }
            
            self.casterSectionModel = listCasters
            self.episodeSectionModel = listEpisodes
            self.seasonCardModel = listSeasons
            self.model = show
            
        }
        catch {
            print("Fetch Show Error: \(error)")
            updateStateView(with: .error(error))
        }
    }
    
    func validateHTTPResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
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

