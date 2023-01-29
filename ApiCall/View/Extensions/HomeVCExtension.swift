//
//  HomeVCExtension.swift
//  ApiCall
//
//  Created by Rohan Sarkar on 29/01/23.
//

import Foundation
import UIKit

extension HomeViewController: ChargerViewModelDelegate
{
    func didReceiveChargerStateResponse(networkStatus: Bool, chargerStateResponse: ChargerStateModel?) {
        if(networkStatus == true){
            if(chargerStateResponse?.data != nil){
                print("Data loaded successfully.")
                if let response = chargerStateResponse?.data {
                    print("response type: \(response.type!)")
                }
            }
        }else{
            print(Constants.NetworkIssue)
        }
    }
    
    func didReceiveChargingInformation(networkStatus: Bool, chargingInfoResponse: ChargerTransactionModel?) {
        if(networkStatus == true){
            if(chargingInfoResponse?.data != nil){
                print("Data loaded successfully.")
                if let response = chargingInfoResponse?.data {
                    print("response type: \(response.type!)")
                }
            }
        }else{
            print(Constants.NetworkIssue)
        }
    }
    
    func didReceiveLastCommandInformation(networkStatus: Bool, actResponse: ActDataModel?) {
        if(networkStatus == true){
            if(actResponse?.data != nil){
                print("Data loaded successfully.")
                if let response = actResponse?.data {
                    print("response type: \(response.type!)")
                }
            }
        }else{
            print(Constants.NetworkIssue)
        }
    }
    
    func didReceivePublishResponse(networkStatus: Bool, publishResponse: PublishModel?) {
        if(networkStatus == true){
            if(publishResponse?.data != nil){
                print("Data loaded successfully.")
                if let response = publishResponse?.data {
                    print("publish response: \(response)")
                }
            }
        }else{
            print(Constants.NetworkIssue)
        }
    }
}
