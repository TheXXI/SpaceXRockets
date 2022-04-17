//
//  InformationView.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 16.04.2022.
//

import UIKit

class GeneralInformationView: UIView {

    // MARK: - Private properties

    private var lines = [GeneralLabelsView]()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        for index in 0...2 {
            let labelsLine = GeneralLabelsView()
            switch index {
            case 0:
                labelsLine.setValueName(name: "Первый запуск")
            case 1:
                labelsLine.setValueName(name: "Страна")
            case 2:
                labelsLine.setValueName(name: "Стоимость запуска")
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

    func setupValues(firstLaunch: String, counrty: String, cost: Int) {
        lines[0].setValue(value: firstLaunch)
        lines[1].setValue(value: counrty)
        lines[2].setValue(value: String(cost))
    }

    // MARK: - Private methods

    private func setupLabelsLineConstraints(index: Int) {
        lines[index].translatesAutoresizingMaskIntoConstraints = false
        var constraints = [
            lines[index].leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lines[index].trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lines[index].heightAnchor.constraint(equalToConstant: 55)
        ]

        if index == 0 {
            constraints.append( lines[index].topAnchor.constraint(equalTo: self.topAnchor) )
        } else {
            constraints.append( lines[index].topAnchor.constraint(equalTo: lines[index - 1].bottomAnchor) )
        }
        NSLayoutConstraint.activate(constraints)
    }
}
