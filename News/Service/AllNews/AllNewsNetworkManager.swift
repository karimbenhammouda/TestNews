//
//  AllNewsNetworkManager.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import Foundation

protocol AllNewsNetworkManagerProtocol{
    func getNewsList(completion: @escaping (NewsList?) -> Void)
}

struct AllNewsNetworkManager: AllNewsNetworkManagerProtocol{
    func getNewsList(completion: @escaping (NewsList?) -> Void) {
        GetApiRequest(APIRoute.getNewsList.urlRequest) { (finished, response) in
            if(finished)
            {
                do {
                    if let response = response as? Data {
                        let decoder = JSONDecoder()
                        let productsList = try decoder.decode(NewsList.self, from: response)
                        completion(productsList)
                    }
                } catch {
                    print(String.init(format: ApiLog.jsonErrorDeserializing,"\(error.localizedDescription)"))
                }
            }
            else {
                completion(nil)
            }
        }
    }
}
