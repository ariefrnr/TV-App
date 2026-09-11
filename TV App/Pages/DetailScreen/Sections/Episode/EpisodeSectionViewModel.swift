//
//  EpisodeSectionViewModel.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

import SwiftUI
import Combine

struct EpisodeSectionModel: Hashable, Identifiable {
    let id: Int
    let name: String
    let airdate: String
}

class EpisodeSectionViewModel: ObservableObject {
    init(model: [EpisodeSectionModel]? = []) {
        self.model = model
    }
    
    private var model: [EpisodeSectionModel]?
}

extension EpisodeSectionViewModel {
    func getEpisodes() -> [EpisodeSectionModel] {
        return self.model ?? []
    }
}
