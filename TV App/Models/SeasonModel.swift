//
//  SeasonModel.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

struct SeasonModel: Decodable {
    let id: Int
    let url: String
    let number: Int?
    let name: String?
    let episodeOrder: Int?
    let premiereDate: String?
    let endDate: String?
    let network: NetworkModel?
    let webChannel: WebChannelModel?
    let image: ImageModel?
    let summary: String?
    let _links: LinkModel?
}
