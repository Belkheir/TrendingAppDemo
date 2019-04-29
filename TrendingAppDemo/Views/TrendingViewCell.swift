//
//  TrendingViewCell.swift
//  TrendingAppDemo
//
//  Created by Belkheir Oussama on 29/04/2019.
//  Copyright © 2019 Belkheir Oussama. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

class TrendingViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bindViewModel(viewModel: TrendingCellViewModel)  {
        self.repoNameLabel.text = viewModel.repoName
        self.repoDescriptionLabel.text = viewModel.repoDescription
        self.numberOfStarsLabel.text = viewModel.numberOfStars
        self.repoOwnerName.text = viewModel.repoOwnerName
        self.imageRepoOwner.sd_setImage(with: URL(string: viewModel.imageRepoOwnerLink), placeholderImage: UIImage(named: "placeholder.png"))
    }

    let repoNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Repo name"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let repoDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Repo description"
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let repoOwnerName: UILabel = {
        let label = UILabel()
        label.text = "Repo Owner name"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let numberOfStarsLabel: UILabel = {
        let label = UILabel()
        label.text = "number of stars"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let imageRepoOwner: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    let starImageView: UIImageView = {
        let image = UIImage(named: "trending_icon")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    let bottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        line.translatesAutoresizingMaskIntoConstraints = false

        return line
    }()

    private func setUpViews() {
        addSubViews()
        makeConstraints()
    }

    private func addSubViews() {
        self.contentView.addSubview(repoNameLabel)
        self.contentView.addSubview(repoDescriptionLabel)
        self.contentView.addSubview(imageRepoOwner)
        self.contentView.addSubview(repoOwnerName)
        self.contentView.addSubview(starImageView)
        self.contentView.addSubview(numberOfStarsLabel)
        self.contentView.addSubview(bottomLine)
    }

    private func makeConstraints() {
        self.repoNameLabel.snp.makeConstraints { make in
            make.top.left.equalTo(self.contentView).offset(20)
            make.height.equalTo(40)
            make.right.equalTo(self.contentView).offset(-20)
        }
        self.repoDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(self.repoNameLabel.snp.bottom).offset(5)
            make.left.right.equalTo(self.repoNameLabel)
        }
        self.imageRepoOwner.snp.makeConstraints { make in
            make.top.equalTo(self.repoDescriptionLabel.snp.bottom).offset(20)
            make.left.equalTo(self.repoDescriptionLabel)
            make.height.width.equalTo(40)
            make.bottom.equalTo(self.contentView).offset(-10)
        }
        self.repoOwnerName.snp.makeConstraints { make in
            make.top.equalTo(self.imageRepoOwner)
            make.left.equalTo(self.imageRepoOwner.snp.right)
            make.height.equalTo(40)
            make.bottom.equalTo(self.contentView).offset(-10)
        }

        self.numberOfStarsLabel.snp.makeConstraints { make in
            make.top.equalTo(self.repoOwnerName)
            make.right.equalTo(self.contentView).offset(-10)
            make.height.equalTo(40)
            make.bottom.equalTo(repoOwnerName)
        }

        self.starImageView.snp.makeConstraints { make in
            make.top.size.bottom.equalTo(self.imageRepoOwner)
            make.right.equalTo(self.numberOfStarsLabel.snp.left)
        }

        self.bottomLine.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self.contentView)
            make.height.equalTo(1)
        }

    }


}
