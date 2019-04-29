//
//  CustomTabBarController.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {

    public enum PageType: CustomStringConvertible {
        case trending
        case settings

        public var description: String {
            switch self {
            case .trending:
                return "Trending"
            case .settings:
                return "Settings"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let trendingNavigationViewController = UINavigationController(rootViewController: trendingViewController)
        let settingsNavigationViewController = UINavigationController(rootViewController: settingsViewController)

        viewControllers = [trendingNavigationViewController, settingsNavigationViewController]
    }

    let trendingViewController: TrendingViewController = {
        let trendingViewModel = TrendingViewModel(networkingClient: NetworkingClient.sharedInstance)
        let viewController = TrendingViewController(viewModel: trendingViewModel)
        viewController.title  = "Trending Repos"
        viewController.tabBarItem = UITabBarItem(title: PageType.trending.description, image: UIImage(named: "trending_icon"), selectedImage: nil)

        return viewController
    }()

    let settingsViewController: SettingsViewController = {
        let viewController = SettingsViewController()
        viewController.title  = "Settings"
        viewController.tabBarItem.image = UIImage(named: "settings_icon")

        return viewController
    }()

}
