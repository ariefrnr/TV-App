//
//  Network.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 11/09/26.
//

import SwiftUI

protocol TVMazeServiceProtocol {
    func getShows() async throws -> [ShowModel]
    func getShow(id: Int) async throws -> ShowModel
    func getEpisodes(id: Int) async throws -> [EpisodeModel]
    func getSeasons(id: Int) async throws -> [SeasonModel]
    func getCaster(id: Int) async throws -> [CasterModel]
}

class TVMazeService: TVMazeServiceProtocol {
    func getShow(id: Int) async throws -> ShowModel {
        let data = try await self.performNetworkRequest(
            api_url: "\(Environment.apiUrl)shows/\(id)"
        )
        return try parseJSON(data)
    }
    
    func getShows() async throws -> [ShowModel] {
        let data = try await self.performNetworkRequest(
            api_url: "\(Environment.apiUrl)shows?page=0"
        )
        return try parseJSON(data)
    }
    
    func getEpisodes(id: Int) async throws -> [EpisodeModel] {
        let data = try await self.performNetworkRequest(
            api_url: "\(Environment.apiUrl)shows/\(id)/seasons"
        )
        return try parseJSON(data)
    }
    
    func getSeasons(id: Int) async throws -> [SeasonModel] {
        let data = try await self.performNetworkRequest(
            api_url: "\(Environment.apiUrl)shows/\(id)/episodes"
        )
        return try parseJSON(data)
    }
    
    func getCaster(id: Int) async throws -> [CasterModel] {
        let data = try await self.performNetworkRequest(
            api_url: "\(Environment.apiUrl)shows/\(id)/cast"
        )
        return try parseJSON(data)
    }
    
    private func parseJSON(_ data: Data) throws -> ShowModel {
        let decoder = JSONDecoder()
        return try decoder.decode(ShowModel.self, from: data)
    }
    
    private func parseJSON(_ data: Data) throws -> [ShowModel] {
        let decoder = JSONDecoder()
        return try decoder.decode([ShowModel].self, from: data)
    }
    
    private func parseJSON(_ data: Data) throws -> [CasterModel] {
        let decoder = JSONDecoder()
        return try decoder.decode([CasterModel].self, from: data)
    }
    
    private func parseJSON(_ data: Data) throws -> [EpisodeModel] {
        let decoder = JSONDecoder()
        return try decoder.decode([EpisodeModel].self, from: data)
    }
    
    private func parseJSON(_ data: Data) throws -> [SeasonModel] {
        let decoder = JSONDecoder()
        return try decoder.decode([SeasonModel].self, from: data)
    }
    
    private func performNetworkRequest(api_url: String) async throws -> Data {
        guard let url = URL(string: api_url) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        try validateHTTPResponse(response)
        
        return data
    }
    
    private func validateHTTPResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
    }
}
