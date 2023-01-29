//
//  ChargerStateModel.swift
//  ApiCall
//
//  Created by Rohan Sarkar on 27/01/23.
//

import Foundation

struct ChargerStateModel : Codable {
    let data : ChargerData?

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(ChargerData.self, forKey: .data)
    }
}


struct ChargerData : Codable {
    let c_type : Int?
    let charge_state : Int?
    let cp_state : Bool?
    let loc : [String]?
    let rssi : Int?
    let timestamp : Int?
    let type : String?
    let vol : Double?
    let wcred : [String]?

    enum CodingKeys: String, CodingKey {

        case c_type = "c_type"
        case charge_state = "charge_state"
        case cp_state = "cp_state"
        case loc = "loc"
        case rssi = "rssi"
        case timestamp = "timestamp"
        case type = "type"
        case vol = "vol"
        case wcred = "wcred"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        c_type = try values.decodeIfPresent(Int.self, forKey: .c_type)
        charge_state = try values.decodeIfPresent(Int.self, forKey: .charge_state)
        cp_state = try values.decodeIfPresent(Bool.self, forKey: .cp_state)
        loc = try values.decodeIfPresent([String].self, forKey: .loc)
        rssi = try values.decodeIfPresent(Int.self, forKey: .rssi)
        timestamp = try values.decodeIfPresent(Int.self, forKey: .timestamp)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        vol = try values.decodeIfPresent(Double.self, forKey: .vol)
        wcred = try values.decodeIfPresent([String].self, forKey: .wcred)
    }

}
