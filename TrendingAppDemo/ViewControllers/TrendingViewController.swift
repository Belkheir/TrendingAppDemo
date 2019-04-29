//
//  TrendingViewController.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import SVProgressHUD

class TrendingViewController: UIViewController {

    let viewModel: TrendingViewModel
    private let reuseIdentifier = "trendingCellIdentifier"
    private var pageIndex: Int = 1

    init(viewModel: TrendingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        view.estimatedRowHeight = 60
        view.separatorStyle = .none
        view.register(TrendingViewCell.self, forCellReuseIdentifier: reuseIdentifier)

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUpViews()
        fetchRecentRepositories()
    }

    private func setUpViews() {
        addSubViews()
        makeConstraints()
    }

    private func addSubViews() {
        self.view.addSubview(self.tableView)
    }

    private func makeConstraints() {
        self.tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }

    private func fetchRecentRepositories() {
        self.displayActivityIndicatorUntilActivityOnSignal(signal: self.viewModel.fetchAllRepositoriesAPI()).startWithResult { [weak self] result in
            guard let `self` = self else { return }

            switch result {
            case .success(_):
                self.tableView.reloadData()

            case .failure(let error):
                UIAlertHelper.displayUIAlert(with: "Error", error: error, from: self)
            }
        }
    }

}

extension TrendingViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.trendingCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! TrendingViewCell
        let cellViewModel = self.viewModel.trendingCellViewModels[indexPath.row]
        cell.bindViewModel(viewModel: cellViewModel)

        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
