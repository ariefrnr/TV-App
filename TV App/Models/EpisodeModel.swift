//
//  EpisodeModel.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

struct EpisodeModel: Decodable, Hashable {
    let id: Int
    let url: String
    let name: String?
    let season: Int?
    let number: Int?
    let type: String?
    let airdate: String?
    let airtime: String?
    let airstamp: String?
    let runtime: Int?
    let rating: RatingModel?
    let image: ImageModel?
    let summary: String?
    let _links: LinkModel?
    let show: EpisodeShowModel?
}

struct EpisodeShowModel: Decodable, Hashable {
    let href: String?
    let name: String?
}
