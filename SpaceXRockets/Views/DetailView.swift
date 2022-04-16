//
//  DetailView.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 16.04.2022.
//

import UIKit

class DetailView: UIView {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        //scrollView.backgroundColor = .orange
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let rocketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private var headerView: HeaderView!
    private var parametersCollectionView: UICollectionView!
    private var generalInformationView: GeneralInformationView!
    private var firstStageInformationView: StageInformationView!
    private var secondStageInformationView: StageInformationView!

    private let lookLaunchesButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.tintColor = UIColor(named: "textWhite")
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22.0)
        button.backgroundColor = UIColor.init(rgb: 0x212121)
        button.setTitle("Посмотреть запуски", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureUI() {
        addSubview(scrollView)
        setupScrollViewConstraints()
        scrollView.addSubview(rocketImageView)
        setupRocketImageViewConstraints()

        headerView = HeaderView()
        headerView.configure(rocketName: "Falcon Heavy")
        scrollView.addSubview(headerView)
        setupHeaderViewConstraints()

        createParametersCollectionView()

        generalInformationView = GeneralInformationView()
        generalInformationView.setupValues(
            firstValue: "7 февраля, 2018",
            secondValue: "США",
            thirdValue: "$90 млн"
        )
        scrollView.addSubview(generalInformationView)
        setupGeneralInformationViewConstraints()

        firstStageInformationView = StageInformationView()
        firstStageInformationView.setupHeaderText(headerText: "ПЕРВАЯ СТУПЕНЬ")
        firstStageInformationView.setupValues(
            firstValue: "27",
            secondValue: "308,6",
            secondMetric: "ton",
            thirdValue: "593",
            thirdMetric: "sec")
        scrollView.addSubview(firstStageInformationView)
        setupStageInformationViewConstraints(currentView: firstStageInformationView)

        secondStageInformationView = StageInformationView()
        secondStageInformationView.setupHeaderText(headerText: "ВТОРАЯ СТУПЕНЬ")
        secondStageInformationView.setupValues(
            firstValue: "27",
            secondValue: "308,6",
            secondMetric: "ton",
            thirdValue: "593",
            thirdMetric: "sec")
        scrollView.addSubview(secondStageInformationView)
        setupStageInformationViewConstraints(currentView: secondStageInformationView)

        scrollView.addSubview(lookLaunchesButton)
        setupLookLaunchesButtonConstraints()

        /*NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            rocketImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            rocketImageView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            rocketImageView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            rocketImageView.heightAnchor.constraint(equalToConstant: 300),

            headerView.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: -32),
            headerView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100),

            parametersCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            parametersCollectionView.heightAnchor.constraint(equalToConstant: 120),
            parametersCollectionView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            parametersCollectionView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -32),

            generalInformationView.topAnchor.constraint(equalTo: parametersCollectionView.bottomAnchor, constant: 40),
            generalInformationView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            generalInformationView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            generalInformationView.heightAnchor.constraint(equalToConstant: 170),

            firstStageInformationView.topAnchor.constraint(equalTo: generalInformationView.bottomAnchor, constant: 40),
            firstStageInformationView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            firstStageInformationView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            firstStageInformationView.heightAnchor.constraint(equalToConstant: 216),

            secondStageInformationView.topAnchor.constraint(equalTo: firstStageInformationView.bottomAnchor, constant: 40),
            secondStageInformationView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            secondStageInformationView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            secondStageInformationView.heightAnchor.constraint(equalToConstant: 216),

            lookLaunchesButton.topAnchor.constraint(equalTo: secondStageInformationView.bottomAnchor),
            lookLaunchesButton.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            lookLaunchesButton.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            lookLaunchesButton.heightAnchor.constraint(equalToConstant: 70),
            lookLaunchesButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -32)
        ])*/
    }

    private func createParametersCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        parametersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        parametersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        parametersCollectionView.register(ParametersCollectionCell.self, forCellWithReuseIdentifier: ParametersCollectionCell.identifier)
        parametersCollectionView.showsHorizontalScrollIndicator = false
        parametersCollectionView.backgroundColor = .black
        scrollView.addSubview(parametersCollectionView)

        setupParametersCollectionViewConstraints()
    }

    // MARK: - Add Constraints

    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    private func setupRocketImageViewConstraints() {
        NSLayoutConstraint.activate([
            rocketImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            rocketImageView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            rocketImageView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            rocketImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    private func setupHeaderViewConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: -32),
            headerView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func setupParametersCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            parametersCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            parametersCollectionView.heightAnchor.constraint(equalToConstant: 120),
            parametersCollectionView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            parametersCollectionView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -32)
        ])
    }

    private func setupGeneralInformationViewConstraints() {
        NSLayoutConstraint.activate([
            generalInformationView.topAnchor.constraint(equalTo: parametersCollectionView.bottomAnchor, constant: 40),
            generalInformationView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            generalInformationView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            generalInformationView.heightAnchor.constraint(equalToConstant: 170)
        ])
    }

    private func setupStageInformationViewConstraints(currentView: StageInformationView) {
        var constraints = [
            currentView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            currentView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            currentView.heightAnchor.constraint(equalToConstant: 216)
        ]

        if currentView == firstStageInformationView {
            constraints.append(currentView.topAnchor.constraint(equalTo: generalInformationView.bottomAnchor, constant: 40))
        } else {
            constraints.append(currentView.topAnchor.constraint(equalTo: firstStageInformationView.bottomAnchor, constant: 40))
        }
        NSLayoutConstraint.activate(constraints)
    }

    private func setupLookLaunchesButtonConstraints() {
        NSLayoutConstraint.activate([
            lookLaunchesButton.topAnchor.constraint(equalTo: secondStageInformationView.bottomAnchor),
            lookLaunchesButton.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            lookLaunchesButton.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            lookLaunchesButton.heightAnchor.constraint(equalToConstant: 70),
            lookLaunchesButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -32)
        ])
    }

    // MARK: - Lifecycle

    override func layoutSubviews() {
        parametersCollectionView?.delegate = self
        parametersCollectionView?.dataSource = self
    }
}

extension DetailView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParametersCollectionCell.identifier, for: indexPath) as! ParametersCollectionCell
        return cell
    }

}

/*
 addSubview(scrollView)
 scrollView.addSubview(rocketImageView)

 let label = UILabel()
 label.backgroundColor = .gray
 scrollView.addSubview(label)

 let button = UIButton()
 button.setTitle("Button", for: .normal)
 button.backgroundColor = .brown
 scrollView.addSubview(button)

 label.translatesAutoresizingMaskIntoConstraints = false
 button.translatesAutoresizingMaskIntoConstraints = false

 NSLayoutConstraint.activate([
     scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
     scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
     scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
     scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

     rocketImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
     rocketImageView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
     rocketImageView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
     rocketImageView.heightAnchor.constraint(equalToConstant: 300),

     label.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor),
     label.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
     label.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
     label.heightAnchor.constraint(equalToConstant: 1000),

     button.topAnchor.constraint(equalTo: label.bottomAnchor),
     button.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
     button.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
     button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)

 ])
 */
