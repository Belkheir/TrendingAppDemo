//
//  TrendingCellViewModel.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation

class TrendingCellViewModel {

    let repoName: String
    let repoDescription: String
    var imageRepoOwnerLink: String
    let repoOwnerName: String
    var numberOfStars: String?

    init(repository: Repository) {
        self.repoName = repository.full_name
        self.repoDescription = repository.description ?? ""
        self.imageRepoOwnerLink = repository.owner.avatar_url
        self.repoOwnerName = repository.name
        self.numberOfStars = repository.stargazers_count.abreviatedNumber
    }

}
