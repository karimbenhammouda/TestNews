//
//  NetworkManager.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import Foundation

func GetApiRequest(_ urlString: String, completion:@escaping (_ finished: Bool, _ response: AnyObject?) ->Void) {
    let session = URLSession.shared
    guard let url = URL(string: urlString) else {
        print(ApiLog.urlError + urlString)
        completion(false, ApiLog.urlError as AnyObject?)
        return
    }

    let task = session.dataTask(with: url) { data, response, error in

        if error != nil || data == nil {
            print(ApiLog.clientError + urlString)
            completion(false, error as AnyObject?)
            return
        }

        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            print(ApiLog.serverError + urlString)
            completion(false, error as AnyObject?)
            return
        }

        completion(true, data as AnyObject?)
    }

    task.resume()
}
