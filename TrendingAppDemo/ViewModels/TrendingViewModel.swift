//
//  TrendingViewModel.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation
import ReactiveSwift

class TrendingViewModel {
    let networkingClient: GithubAPIServices
    var trendingCellViewModels: [TrendingCellViewModel] = []
    var pageIndex: Int = 1

    init(networkingClient: GithubAPIServices) {
        self.networkingClient = networkingClient
    }

    func fetchAllRepositoriesAPI() -> SignalProducer<Void, NetworkingError> {

        let date = Date()
        let previousDate = date.remove(numberOfDays: 30)
        let stringDate = previousDate.toString()

        return self.networkingClient.getBestStarredRepos(since: stringDate, for: pageIndex).on(value: { [weak self] repositories in
            guard let `self` = self else {
                return
            }
            let trendingCellVM = repositories.compactMap{ TrendingCellViewModel(repository: $0) }
            self.trendingCellViewModels.append(contentsOf: trendingCellVM)

        }).map { _ in () }
    }

}
