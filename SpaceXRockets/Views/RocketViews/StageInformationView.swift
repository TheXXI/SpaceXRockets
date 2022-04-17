//
//  InformationViewWithHeader.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 16.04.2022.
//

import UIKit

class StageInformationView: UIView {

    // MARK: - Private properties

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "textWhite")
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var lines = [StageLabelsView]()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerLabel)
        setupHeaderLabelConstraints()
        for index in 0...2 {
            let labelsLine = StageLabelsView()
            switch index {
            case 0:
                labelsLine.setValueName(name: "Количество двигателей")
            case 1:
                labelsLine.setValueName(name: "Количество топлива")
                labelsLine.setMetric(metric: "ton")
            case 2:
                labelsLine.setValueName(name: "Время сгорания")
                labelsLine.setMetric(metric: "sec")
            default:
                break
            }
            addSubview(labelsLine)
            lines.append(labelsLine)
            setupLabelsLineConstraints(index: index)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func setupHeaderText(headerText: String) {
        headerLabel.text = headerText
    }

    func setupValues(engines: Int, fuel: Int, burnTime: Int) {
        lines[0].setValue(value: String(engines))
        lines[1].setValue(value: String(fuel))
        lines[2].setValue(value: String(burnTime))
    }

    // MARK: - Private methods

    private func setupHeaderLabelConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            headerLabel.heightAnchor.constraint(equalToConstant: 50)

        ])
    }

    private func setupLabelsLineConstraints(index: Int) {
        lines[index].translatesAutoresizingMaskIntoConstraints = false
        var constraints = [
            lines[index].leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lines[index].trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lines[index].heightAnchor.constraint(equalToConstant: 55)
        ]

        if index == 0 {
            constraints.append( lines[index].topAnchor.constraint(equalTo: headerLabel.bottomAnchor) )
        } else {
            constraints.append( lines[index].topAnchor.constraint(equalTo: lines[index - 1].bottomAnchor) )
        }
        NSLayoutConstraint.activate(constraints)
    }

}
