//
//  AverageRatingSectionViewModel.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 11/09/26.
//

import SwiftUI
import Combine

struct AverageRatingSectionModel {
    let averageRating: String?
    let premiereDate: String?
}

class AverageRatingSectionViewModel: ObservableObject {
    init(model: AverageRatingSectionModel) {
        self.model = model
    }
    
    private let model: AverageRatingSectionModel
}

extension AverageRatingSectionViewModel {
    func getAverageRating() -> String { self.model.averageRating ?? "No ratings yet" }
    func getPremiereDate() -> String { self.model.premiereDate ?? "Not premiered yet" }
}
