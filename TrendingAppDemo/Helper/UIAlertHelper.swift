//
//  UIAlertHelper.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import UIKit

public class UIAlertHelper {

    static func displayUIAlert(with title: String, error: NetworkingError, from viewController: UIViewController) -> Void {

        let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler:nil))
        if (viewController.presentedViewController == nil) {
            viewController.present(alert, animated: false, completion: nil)
        } else {
            viewController.presentedViewController?.dismiss(animated: false, completion: {
                viewController.present(alert, animated: false, completion: nil)
            })

        }

    }

}
