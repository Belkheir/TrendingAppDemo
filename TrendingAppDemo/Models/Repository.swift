//
//  Repository.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation

public struct Repository: Decodable {

    let name: String
    let full_name: String
    let owner: Owner
    let stargazers_count: Double
    let description: String?
}
