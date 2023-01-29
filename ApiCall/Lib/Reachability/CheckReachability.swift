//
//  CheckReachability.swift
//  ApiCall
//
//  Created by Rohan Sarkar on 27/01/23.
//

import Foundation

class CheckReachability {
    
    static let sharedInstance = CheckReachability()
    
    func isConnectedToNetwork() -> Bool {
        let status = Reach().connectionStatus()
        var isConnected: Bool = false
        switch status {
            case .unknown, .offline:
                isConnected = false
                break
            case .online(.wwan):
                isConnected = true
                break
            case .online(.wiFi):
                isConnected = true
                break
        }
        return isConnected
    }
    
}
