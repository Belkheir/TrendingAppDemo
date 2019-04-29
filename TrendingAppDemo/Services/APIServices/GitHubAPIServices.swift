//
//  GitHubAPIServices.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation
import ReactiveSwift

public protocol GithubAPIServices {
    func getBestStarredRepos(since stringDate: String, for index: Int ) -> SignalProducer<[Repository], NetworkingError>
}
