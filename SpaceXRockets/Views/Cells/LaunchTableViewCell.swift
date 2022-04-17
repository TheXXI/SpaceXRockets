//
//  LaunchTableView.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 17.04.2022.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {

    // MARK: - Public properties

    static let identifier = "LaunchTableViewCell"

    // MARK: - Private properties

    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "cellsColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()

    private let launchName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let launchData: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(named: "metricTextColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let launchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func configure(name: String, dateUnix: Int, success: Bool) {
        launchName.text = name
        launchData.text = TimeFormatter.getTime(format: "dd MMM, YYYY", unixtime: dateUnix)
        if success {
            launchImageView.image = UIImage(named: "launchSuccess")
        } else {
            launchImageView.image = UIImage(named: "launchFailed")
        }
    }

    // MARK: - Private methods

    private func addSubviews() {
        addSubview(view)
        view.addSubview(launchName)
        view.addSubview(launchData)
        view.addSubview(launchImageView)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),

            launchName.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            launchName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            launchData.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            launchData.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),

            launchImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            launchImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }

}
