//
//  ChargerViewModel.swift
//  ApiCall
//
//  Created by Rohan Sarkar on 27/01/23.
//

import Foundation

protocol ChargerViewModelDelegate {
    func didReceiveChargerStateResponse(networkStatus: Bool, chargerStateResponse: ChargerStateModel?)
    func didReceiveChargingInformation(networkStatus: Bool, chargingInfoResponse: ChargerTransactionModel?)
    func didReceiveLastCommandInformation(networkStatus: Bool, actResponse: ActDataModel?)
    func didReceivePublishResponse(networkStatus: Bool, publishResponse: PublishModel?)
}

struct ChargerViewModel
{
    var delegate: ChargerViewModelDelegate?
    
    let chargerStateResource = ChargerStateResource()
    
    // Fetching the information of charger state
    func fetchChargerState()
    {
        chargerStateResource.fetchChargerState { networkStatus, result in
            DispatchQueue.main.async {
                self.delegate?.didReceiveChargerStateResponse(networkStatus: networkStatus, chargerStateResponse: result)
            }
        }
    }
    
    // Fetching the information about charging of charger
    func fetchChargingInformation()
    {
        chargerStateResource.fetchChargingInformation { networkStatus, result in
            DispatchQueue.main.async {
                self.delegate?.didReceiveChargingInformation(networkStatus: networkStatus, chargingInfoResponse: result)
            }
        }
    }
    
    // Fetching the information about the last commands being run
    func fetchLastCommandsInformation()
    {
        chargerStateResource.fetchLastCommandsInformation { networkStatus, result in
            DispatchQueue.main.async {
                self.delegate?.didReceiveLastCommandInformation(networkStatus: networkStatus, actResponse: result)
            }
        }
    }
    
    // Fetching the information about publish
    func publish(parameters: [String : Any])
    {
        chargerStateResource.publish(parameters: parameters.jsonData) { networkStatus, result in
            DispatchQueue.main.async {
                self.delegate?.didReceivePublishResponse(networkStatus: networkStatus, publishResponse: result)
            }
        }
    }
}

