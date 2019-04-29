//
//  NetworkingClient.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation
import ReactiveSwift

public class NetworkingClient {
    static let sharedInstance = NetworkingClient()
    typealias NetworkingClientResult = (Data?, Error?) -> Void

    private init() {}

    func performRequest(urlString: String, parameters: [String: String]?, completionHandler: @escaping NetworkingClientResult ) {
        var finalURL: URL
        var networkingError: NetworkingError?

        guard let url = URL(string: urlString) else {
            print("Error: cannot create URL")
            return
        }

        finalURL = url

        if let urlParams = parameters, urlParams.count > 0  {
            var queryItems: [URLQueryItem] = []
            var urlComps = URLComponents(string: urlString)!

            urlParams.forEach { (key, value) in
                queryItems.append(URLQueryItem(name: key, value: value))
            }
            urlComps.queryItems = queryItems
            finalURL = urlComps.url!
        }

        let urlRequest = URLRequest(url: finalURL)

        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                networkingError = NetworkingError.requestFailed(url, error!)
                print(error!)
                return
            }
            defer {
                completionHandler(data, networkingError)
            }

        }
        task.resume()
    }
}

extension URL {

    func appending(_ queryItem: String, value: String?) -> URL {

        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }

        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)

        // Append the new query item in the existing query items array
        queryItems.append(queryItem)

        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems

        // Returns the url from new url components
        return urlComponents.url!
    }
}
