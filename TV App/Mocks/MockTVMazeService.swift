//
//  MockTVMazeService.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 11/09/26.
//

class MockTVMazeService: TVMazeServiceProtocol {
    var mockShows: [ShowModel] = []
    var mockShow: ShowModel
    var mockEpisodes: [EpisodeModel] = []
    var mockSeasons: [SeasonModel] = []
    var mockCaster: [CasterModel] = []
    
    init(mockShow: ShowModel) {
        self.mockShow = mockShow
    }
    
    func getShows() async throws -> [ShowModel] {
        return [mockShow]
    }
    
    func getShow(id: Int) async throws -> ShowModel {
        return mockShow
    }
    
    func getEpisodes(id: Int) async throws -> [EpisodeModel] {
        return mockEpisodes
    }
    
    func getSeasons(id: Int) async throws -> [SeasonModel] {
        return mockSeasons
    }
    
    func getCaster(id: Int) async throws -> [CasterModel] {
        return mockCaster
    }
    
    func fetchShows() async throws -> [ShowModel] {
        return mockShows // Langsung mengembalikan data tanpa jeda jaringan
    }
}
