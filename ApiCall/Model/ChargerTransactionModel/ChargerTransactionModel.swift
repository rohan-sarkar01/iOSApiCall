//
//  ChargerTransactionModel.swift
//  ApiCall
//
//  Created by Rohan Sarkar on 29/01/23.
//

import Foundation

struct ChargerTransactionModel : Codable {
    let data : ChargerTransactionData?

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(ChargerTransactionData.self, forKey: .data)
    }
}

struct ChargerTransactionData : Codable {
    let actpower : Double?
    let end_reason : String?
    let end_time : Int?
    let frq : Double?
    let p_f : Double?
    let power : Double?
    let start_time : Int?
    let total_usage : Double?
    let tx_status : Int?
    let txd_id : String?
    let type : String?
    let user_id : String?
    let vol : Double?

    enum CodingKeys: String, CodingKey {
        case actpower = "actpower"
        case end_reason = "end_reason"
        case end_time = "end_time"
        case frq = "frq"
        case p_f = "p_f"
        case power = "power"
        case start_time = "start_time"
        case total_usage = "total_usage"
        case tx_status = "tx_status"
        case txd_id = "txd_id"
        case type = "type"
        case user_id = "user_id"
        case vol = "vol"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        actpower = try values.decodeIfPresent(Double.self, forKey: .actpower)
        end_reason = try values.decodeIfPresent(String.self, forKey: .end_reason)
        end_time = try values.decodeIfPresent(Int.self, forKey: .end_time)
        frq = try values.decodeIfPresent(Double.self, forKey: .frq)
        p_f = try values.decodeIfPresent(Double.self, forKey: .p_f)
        power = try values.decodeIfPresent(Double.self, forKey: .power)
        start_time = try values.decodeIfPresent(Int.self, forKey: .start_time)
        total_usage = try values.decodeIfPresent(Double.self, forKey: .total_usage)
        tx_status = try values.decodeIfPresent(Int.self, forKey: .tx_status)
        txd_id = try values.decodeIfPresent(String.self, forKey: .txd_id)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        vol = try values.decodeIfPresent(Double.self, forKey: .vol)
    }

}

