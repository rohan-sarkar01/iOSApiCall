//
//  PublishModel.swift
//  ApiCall
//
//  Created by Rohan Sarkar on 29/01/23.
//

import Foundation

struct PublishModel : Codable {
    let data : String?

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(String.self, forKey: .data)
    }

}
