//
//  CasterModel.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

struct CasterModel: Decodable, Hashable {
    let person: Person?
    let character: CharacterModel?
    let selfCast: Bool?
    let voice: Bool?
    
    enum CodingKeys: String, CodingKey {
        case person = "person"
        case character = "character"
        case selfCast = "self"
        case voice = "voice"
    }
}

struct Person: Decodable, Hashable {
    let id: Int
    let url: String
    let name: String?
    let country: CountryModel?
    let birthday: String?
    let deathday: String?
    let gender: String?
    let image: ImageModel?
    let updated: Int?
    let _links: LinkModel?
}

struct CharacterModel: Decodable, Hashable {
    let id: Int
    let url: String
    let name: String?
    let image: ImageModel?
    let _links: LinkModel?
}
