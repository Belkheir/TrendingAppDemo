//
//  ReposPayload.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation

struct ReposPayload: Decodable {
    let items: [Repository]
}
