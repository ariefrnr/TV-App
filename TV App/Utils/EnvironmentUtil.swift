//
//  Environment.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 11/09/26.
//

import SwiftUI

enum Environment {
    static let apiUrl: String = {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "API_URL") as? String else {
            fatalError("API_URL not found in Info.plist")
        }
        return url
    }()
}
