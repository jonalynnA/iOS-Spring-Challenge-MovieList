//
//  Movie.swift
//  MovieListREMAKE
//
//  Created by Jonalynn Masters on 9/13/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import Foundation

struct Movie: Equatable, Codable {
    var name: String
    var hasSeen: Bool
    
    init(name: String, hasSeen: Bool = false) {
        self.name = name
        self.hasSeen = hasSeen
    }
}

