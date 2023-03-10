//
//  Source.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation

class Source: Codable {
    var id: String?
    var name: String

    init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
}

extension Source: Equatable {
    static func == (lhs: Source, rhs: Source) -> Bool {
        return lhs.name == lhs.name
    }
    
}
