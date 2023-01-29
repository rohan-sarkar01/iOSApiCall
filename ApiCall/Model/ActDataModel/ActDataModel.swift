//
//  ActDataModel.swift
//  ApiCall
//
//  Created by Rohan Sarkar on 29/01/23.
//

import Foundation

struct ActDataModel : Codable {
    let data : ChargerActData?

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(ChargerActData.self, forKey: .data)
    }

}


struct ChargerActData : Codable {
    let message : String?
    let request_id : String?
    let success : Bool?
    let type : String?

    enum CodingKeys: String, CodingKey {
        case message = "message"
        case request_id = "request_id"
        case success = "success"
        case type = "type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        request_id = try values.decodeIfPresent(String.self, forKey: .request_id)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}
