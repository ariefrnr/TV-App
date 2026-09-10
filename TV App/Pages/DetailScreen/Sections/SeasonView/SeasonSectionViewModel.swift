//
//  SeasonSectionViewModel.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

import SwiftUI
import Combine

struct SeasonCardModel: Hashable {
    let id: Int
    let name: String?
    let imageURL: String?
}

class SeasonSectionViewModel: ObservableObject {
    init(models: [SeasonCardModel]) {
        self.models = models
    }
    
    private var models: [SeasonCardModel]?
}

extension SeasonSectionViewModel {
    func getSeasons() -> [SeasonCardModel] { self.models ?? [] }
}
