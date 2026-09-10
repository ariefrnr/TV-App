//
//  ShowModel.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 09/09/26.
//

struct ShowModel: Decodable, Hashable {
    let id: Int
    let url: String
    let name: String?
    let type: String?
    let language: String?
    let genres: [String]?
    let status: String?
    let runtime: Int?
    let averageRuntime: Int?
    let premiered: String?
    let ended: String?
    let officialSite: String?
    let schedule: ScheduleModel?
    let rating: RatingModel?
    let weight: Int?
    let network: NetworkModel?
    let webChannel: WebChannelModel?
    let dvdCountry: CountryModel?
    let externals: ExternalModel?
    let image: ImageModel?
    let summary: String?
    let updated: Int?
    let _links: LinkModel?
}

struct ScheduleModel: Decodable, Hashable {
    let time: String?
    let days: [String]?
}

struct RatingModel: Decodable, Hashable {
    let average: Double?
}

struct NetworkModel: Decodable, Hashable {
    let id: Int
    let name: String?
    let country: CountryModel?
    let officialSite: String?
}

struct CountryModel: Decodable, Hashable {
    let name: String?
    let code: String?
    let timezone: String?
}

struct WebChannelModel: Decodable, Hashable {
    let id: Int
    let name: String?
    let country: CountryModel?
    let officialSite: String?
}

struct ExternalModel: Decodable, Hashable {
    let tvrage: Int?
    let thetvdb: Int?
    let imdb: String?
}

struct ImageModel: Decodable, Hashable {
    let medium: String?
    let original: String?
}

struct LinkModel: Decodable, Hashable {
    let selfLink: SelfLinkModel?
    let previousEpisode: PreviousEpisodeModel?
    
    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
        case previousEpisode = "previousepisode"
    }
}

struct SelfLinkModel: Decodable, Hashable {
    let href: String?
}

struct PreviousEpisodeModel: Decodable, Hashable {
    let href: String?
    let name: String?
}
