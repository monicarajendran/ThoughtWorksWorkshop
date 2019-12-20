//
//  CodableExtension.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation
extension Encodable {
    var toData: Data? {
        return try? PropertyListEncoder()
            .encode(self)
    }
}

extension Decodable {
    static func decode(fromJsonData data: Data) -> Self? {
        let decoder = JSONDecoder()
        guard let object = try? decoder.decode(self.self, from: data) else {
            return nil
        }
        return object
    }
    
    static func decode(fromPlistData data: Data) -> Self? {
        return try? PropertyListDecoder().decode(self.self, from: data)
    }
}
