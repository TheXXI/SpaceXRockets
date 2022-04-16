//
//  InformationViewWithHeaderLabelsLine.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 16.04.2022.
//

import UIKit

class InformationViewWithHeaderLabelsLine: UIView {

    // MARK: - Private properties

    private let valueNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textColor = UIColor(named: "textGray")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = UIColor(named: "textWhite")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var valueMetricLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = UIColor(named: "metricTextColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func setValueName(name: String) {
        valueNameLabel.text = name
    }

    func setValue(value: String) {
        valueLabel.text = value
    }

    func setMetric(metric: String) {
        valueMetricLabel.text = metric
    }

    // MARK: - Private methods

    private func addSubviews() {
        addSubview(valueNameLabel)
        addSubview(valueLabel)
        addSubview(valueMetricLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            valueNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            valueNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),

            valueMetricLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            valueMetricLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            valueMetricLabel.widthAnchor.constraint(equalToConstant: 35),

            valueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: valueMetricLabel.leadingAnchor, constant: -8)
        ])
    }

}
