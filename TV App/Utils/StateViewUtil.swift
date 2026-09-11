//
//  StateViewUtil.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 11/09/26.
//

import SwiftUI

enum StateView: Equatable {
    case loading
    case content
    case error(Error)
    
    static func == (lhs: StateView, rhs: StateView) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading), (.content, .content):
            return true
        case (.error(let lhsError), .error(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
