//
//  TV_App_Tests.swift
//  TV App Tests
//
//  Created by Arief Roihan Nur Rahman on 11/09/26.
//

import Testing
@testable import TV_App

struct TV_App_Tests {

    @Test("Measure the refresh function actually refresh the show data")
    func refresh() async throws {
        let mockService = await MockTVMazeService(
            mockShow: ShowModel(
                id: 1,
                url: "https://mydramalist.com/",
                name: nil,
                type: nil,
                language: nil,
                genres: [],
                status: nil,
                runtime: nil,
                averageRuntime: nil,
                premiered: nil,
                ended: nil,
                officialSite: nil,
                schedule: nil,
                rating: nil,
                weight: nil,
                network: nil,
                webChannel: nil,
                dvdCountry: nil,
                externals: nil,
                image: nil,
                summary: nil,
                updated: nil,
                _links: nil
            )
        )
        
        let vm = await ListScreenViewModel(service: mockService)
        
        #expect(await vm.stateView == .loading)
        
        await vm.refresh()
        
        #expect(await vm.stateView == .content)
        #expect(await vm.shows.isEmpty == false)
    }

    @Test("Measure the getShows function actually refresh the show data")
    func getShows() async throws {
        let mockService = await MockTVMazeService(
            mockShow: ShowModel(
                id: 1,
                url: "https://mydramalist.com/",
                name: nil,
                type: nil,
                language: nil,
                genres: [],
                status: nil,
                runtime: nil,
                averageRuntime: nil,
                premiered: nil,
                ended: nil,
                officialSite: nil,
                schedule: nil,
                rating: nil,
                weight: nil,
                network: nil,
                webChannel: nil,
                dvdCountry: nil,
                externals: nil,
                image: nil,
                summary: nil,
                updated: nil,
                _links: nil
            )
        )
        
        let shows = try await mockService.getShows()
        
        #expect(shows.isEmpty == false)
    }
}
