//
//  GetLeaguesResponseBody.swift
//  Betterpick
//
//  Created by David Bielik on 24/04/2020.
//  Copyright © 2020 dvdblk. All rights reserved.
//

import Foundation

struct GetLeaguesResponseBody: Decodable {
    let leagues: [League]
}