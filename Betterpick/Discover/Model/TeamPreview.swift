//
//  TeamPreview.swift
//  Betterpick
//
//  Created by David Bielik on 20/04/2020.
//  Copyright © 2020 dvdblk. All rights reserved.
//

import Foundation

/// Represents a Team with only the necessary information.
struct TeamPreview: Codable {
    let teamId: String
    let name: String
    let logoURL: URL
}
