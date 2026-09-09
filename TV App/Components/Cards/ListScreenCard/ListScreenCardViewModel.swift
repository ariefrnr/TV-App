//
//  ListScreenCardViewModel.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 09/09/26.
//

import SwiftUI
import Combine

class ListScreenCardViewModel: ObservableObject {
    init(model: ListScreenCardModel) {
        self.model = model
    }
    
    private let model: ListScreenCardModel
    private let imagePlaceholder: String = "https://placehold.co/210x295/png"
}

extension ListScreenCardViewModel {
    func getImageURL() -> String { self.model.imageURL ?? imagePlaceholder}
    func getTitle() -> String { self.model.title }
    func getAverageRating() ->String {
        if let rating = self.model.rating {
            return ("\(rating, default: "%.1f")")
        } else {
            return ("No ratings yet")
        }
    }
}

struct ListScreenCardModel {
    let imageURL: String?
    let title: String
    let rating: Double?
}
