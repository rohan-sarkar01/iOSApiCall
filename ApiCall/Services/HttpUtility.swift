//
//  HttpUtility.swift
//  ApiCall
//
//  Created by Rohan Sarkar on 27/01/23.
//

import Foundation

class HttpUtility {
    static let shared = HttpUtility()
    
    private init(){}
    
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ networkStatus: Bool, _ result: T?)-> Void)
    {
        if CheckReachability.sharedInstance.isConnectedToNetwork() == true
        {
            URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
                if(error == nil && responseData != nil && responseData?.count != 0)
                {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(T.self, from: responseData!)
                        _ = completionHandler(true, result)
                    }
                    catch let error{
                        debugPrint("error occured while decoding = \(error.localizedDescription)")
                    }
                }

            }.resume()
        }
        else
        {
            _ = completionHandler(false, nil)
        }
    }

    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ networkStatus: Bool, _ result: T?)-> Void)
    {
        if CheckReachability.sharedInstance.isConnectedToNetwork() == true
        {
            var urlRequest = URLRequest(url: requestUrl)
            urlRequest.httpMethod = "post"
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

            URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in

                if(data != nil && data?.count != 0)
                {
                    do {
                        let response = try JSONDecoder().decode(T.self, from: data!)
                        _ = completionHandler(true, response)
                    }
                    catch let error {
                        debugPrint("error occured while decoding = \(error.localizedDescription)")
                    }
                }
            }.resume()
        }
        else
        {
            _ = completionHandler(false, nil)
        }
    }
    
}
