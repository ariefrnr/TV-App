//
//  StringUtil.swift
//  TV App
//
//  Created by Arief Roihan Nur Rahman on 10/09/26.
//

import SwiftUI

extension String {
    func strippingHTML() -> String {
        let pattern = /<[^>]+>/
        return self.replacing(pattern, with: "")
    }
}
