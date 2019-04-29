//
//  Networking+Repository.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation
import ReactiveSwift

extension NetworkingClient: GithubAPIServices {

    public func getBestStarredRepos(since stringDate: String, for index: Int) -> SignalProducer<[Repository], NetworkingError> {

        let urlString = "https://api.github.com/search/repositories"
        var buildParams = [String: String]()
        buildParams["q"] = "created:>\(stringDate)"
        buildParams["sort"] = "stars"
        buildParams["order"] = "desc"
        buildParams["page"] = "\(index)"

        return SignalProducer { observer, _ in
            self.performRequest(urlString: urlString, parameters: buildParams) { (data, error) in

                if let data = data, data.isEmpty == false {
                    do {
                        let payloadResponse = try JSONDecoder().decode(ReposPayload.self, from: data)
                        observer.send(value: payloadResponse.items)
                        observer.sendCompleted()
                    } catch  {
                        print(error)
                    }
                }
                observer.send(error: NetworkingError.invalidResponse)
            }
        }

    }

}
