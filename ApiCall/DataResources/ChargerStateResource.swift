//
//  ChargerStateResource.swift
//  ApiCall
//
//  Created by Rohan Sarkar on 27/01/23.
//

import Foundation

struct ChargerStateResource
{
    func fetchChargerState(completion: @escaping(_ networkStatus: Bool, _ result: ChargerStateModel?) -> Void)
    {
        let chargerStateUrl = URL(string: ApiBaseUrl.baseUrl+ApiEndpoints.telemetry)!
        let httpUtility = HttpUtility.shared
        httpUtility.getApiData(requestUrl: chargerStateUrl, resultType: ChargerStateModel.self) { networkStatus, result in
            _ = completion(networkStatus, result)
        }
    }
    
    func fetchChargingInformation(completion: @escaping(_ networkStatus: Bool, _ result: ChargerTransactionModel?) -> Void)
    {
        let chargerTransactionUrl = URL(string: ApiBaseUrl.baseUrl+ApiEndpoints.transaction)!
        let httpUtility = HttpUtility.shared
        httpUtility.getApiData(requestUrl: chargerTransactionUrl, resultType: ChargerTransactionModel.self) { networkStatus, result in
            _ = completion(networkStatus, result)
        }
    }
    
    func fetchLastCommandsInformation(completion: @escaping(_ networkStatus: Bool, _ result: ActDataModel?) -> Void)
    {
        let actUrl = URL(string: ApiBaseUrl.baseUrl+ApiEndpoints.act)!
        let httpUtility = HttpUtility.shared
        httpUtility.getApiData(requestUrl: actUrl, resultType: ActDataModel.self) { networkStatus, result in
            _ = completion(networkStatus, result)
        }
    }
    
    func publish(parameters: Encodable, completion: @escaping(_ networkStatus: Bool, _ result: PublishModel?) -> Void)
    {
        let publishUrl = URL(string: ApiBaseUrl.baseUrl+ApiEndpoints.publish)!
        let httpUtility = HttpUtility.shared
        do {
            let publishPostBody = try JSONEncoder().encode(parameters)
            httpUtility.postApiData(requestUrl: publishUrl, requestBody: publishPostBody, resultType: PublishModel.self) { networkStatus, result in
                _ = completion(networkStatus, result)
            }
        }
        catch let error {
            debugPrint(error)
        }
    }
}
