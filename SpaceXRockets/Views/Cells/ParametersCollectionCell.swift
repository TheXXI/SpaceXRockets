//
//  ParametersCollectionCell.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 30.03.2022.
//

import UIKit

class ParametersCollectionCell: UICollectionViewCell {

    // MARK: - Public properties

    static let identifier = "ParametersCollectionCell"

    // MARK: - Private properties

    let parameterValueLabel: UILabel = {
        let label = UILabel()
        label.text = "3,125,735"
        label.font = .boldSystemFont(ofSize: 19.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let parameterNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17.0)
        label.textColor = UIColor(rgb: 0x8E8E8F)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)

        layer.cornerRadius = 32
        backgroundColor = UIColor(named: "cellsColor")

        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func configure(index: Int, value: String) {
        switch index {
        case 0:
            parameterNameLabel.text = "Высота, ft"
        case 1:
            parameterNameLabel.text = "Диаметр, ft"
        case 2:
            parameterNameLabel.text = "Масса, lb"
        case 3:
            parameterNameLabel.text = "Нагрузка, lb"
        default:
            break
        }
        parameterValueLabel.text = value
    }

    // MARK: - Private methods

    private func addSubviews() {
        addSubview(parameterValueLabel)
        addSubview(parameterNameLabel)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            //parameterValueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 35),
            parameterValueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10),
            parameterValueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            //parameterNameLabel.topAnchor.constraint(equalTo: parameterValueLabel.bottomAnchor, constant: 5),
            parameterNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10),
            parameterNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)

        ])
    }

}
