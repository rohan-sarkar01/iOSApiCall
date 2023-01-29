//
//  Common.swift
//  ApiCall
//
//  Created by Rohan Sarkar on 26/01/23.
//

import Foundation

struct Constants {
    static let ErrorAlertTitle = "Error"
    static let OkAlertTitle = "Ok"
    static let CancelAlertTitle = "Cancel"
    static let NetworkIssue = "No network connection. Please try again later."
}

struct ApiBaseUrl {
    static let baseUrl = "https://stg.mqtt.app.terracharge.net/2/"
}

struct ApiEndpoints {
    static let telemetry = "info/telemetry"
    static let transaction = "info/transaction"
    static let act = "info/ack"
    static let publish = "publish"
}

struct ApiParameters {
    static let cmd = "cp_cmd"
    static let requestId = "request_id"
}
