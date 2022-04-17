//
//  HeaderView.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 16.04.2022.
//

import UIKit

class HeaderView: UIView {

    // MARK: - Public properties

    let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = UIColor(named: "textGray")
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Private properties

    private let rocketName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "textWhite")
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .black
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 32
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func configure(rocketName name: String) {
        rocketName.text = name
    }

    // MARK: - Private methods

    private func addSubviews() {
        addSubview(rocketName)
        addSubview(settingsButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            rocketName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            rocketName.topAnchor.constraint(equalTo: self.topAnchor, constant: 48),

            settingsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            settingsButton.centerYAnchor.constraint(equalTo: rocketName.centerYAnchor),
            settingsButton.heightAnchor.constraint(equalToConstant: 30),
            settingsButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }

}
