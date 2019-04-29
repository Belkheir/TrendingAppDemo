//
//  UIViewController+Additions.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation

import UIKit
import ReactiveSwift
import SVProgressHUD

extension UIViewController {

    func displayActivityIndicatorUntilActivityOnSignal<T>(signal: SignalProducer<T, NetworkingError>) -> SignalProducer<T, NetworkingError> {

        return SignalProducer {  observer, _ in
            signal.observe(on: UIScheduler()).on(starting: {
                SVProgressHUD.show(withStatus: "Loading...")

            },failed: { error in
                print("Failed: \(error)")
                SVProgressHUD.dismiss()
                observer.send(error: error)

            }, completed: {
                SVProgressHUD.dismiss()
            }, interrupted: {
                print("Interrupted")
                observer.sendInterrupted()
                SVProgressHUD.dismiss()
            }, value: { value in
                observer.send(value: value)
                SVProgressHUD.dismiss()

            }).start()

        }
    }

}
