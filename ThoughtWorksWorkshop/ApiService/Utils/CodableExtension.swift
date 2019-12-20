//
//  CodableExtension.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 20/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation

extension Decodable {
    static func decode(fromJsonData data: Data) -> Self? {
        let decoder = JSONDecoder()
        guard let object = try? decoder.decode(self.self, from: data) else {
            return nil
        }
        return object
    }
}
