//
//  RocketDetailsView.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 25.03.2022.
//

import UIKit

class RocketDetailsView: UIView {

    // MARK: - Private properties

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.contentSize = CGSize(
            width: UIScreen.main.bounds.size.width,
            height: UIScreen.main.bounds.size.height * 1.53
        )
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()

    private let rocketImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var headerView: HeaderView!
    private var informationView: InformationView!
    private var informationViewsWithHeader = [InformationViewWithHeader]()

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

    private var parametersCollectionView: UICollectionView!

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureScrollView()
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Private methods

    private func configureScrollView() {
        addSubview(scrollView)
        scrollView.addSubview(rocketImage)
        scrollView.addSubview(contentView)
        setupScrollViewAndContentViewConstraints()
    }

    private func configureUI() {

        headerView = HeaderView()
        headerView.configure(rocketName: "Falcon Heavy")
        contentView.addSubview(headerView)
        setupHeaderViewConstraints()

        createParametersCollectionView()

        informationView = InformationView()
        informationView.setupValues(
            firstValue: "7 февраля, 2018",
            secondValue: "США",
            thirdValue: "$90 млн"
        )
        contentView.addSubview(informationView)
        setupInformationViewConstraints()

        for index in 0...1 {
            let informationViewWithHeader = InformationViewWithHeader()
            informationViewWithHeader.setupHeaderText(headerText: "ПЕРВАЯ СТУПЕНЬ")
            informationViewWithHeader.setupValues(
                firstValue: "27",
                secondValue: "308,6",
                secondMetric: "ton",
                thirdValue: "593",
                thirdMetric: "sec")
            contentView.addSubview(informationViewWithHeader)
            informationViewsWithHeader.append(informationViewWithHeader)
            setupInformationViewWithHeaderConstraints(index: index)

            contentView.addSubview(lookLaunchesButton)
            setupLookLaunchesButtonConstraints()
        }

    }

    private func createParametersCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        parametersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        parametersCollectionView.register(ParametersCollectionCell.self, forCellWithReuseIdentifier: ParametersCollectionCell.identifier)
        parametersCollectionView.showsHorizontalScrollIndicator = false
        parametersCollectionView.backgroundColor = .black
        contentView.addSubview(parametersCollectionView)

        setupParametersCollectionViewConstraints()
    }

    // MARK: - Add Constraints

    private func setupScrollViewAndContentViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            rocketImage.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            rocketImage.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            rocketImage.heightAnchor.constraint(equalToConstant: 310),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 280),
            contentView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupHeaderViewConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func setupParametersCollectionViewConstraints() {
        parametersCollectionView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                parametersCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
                parametersCollectionView.heightAnchor.constraint(equalToConstant: 120),
                parametersCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
                parametersCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32)
            ])
    }

    private func setupInformationViewConstraints() {
        informationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            informationView.topAnchor.constraint(equalTo: parametersCollectionView.bottomAnchor, constant: 40),
            informationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            informationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            informationView.heightAnchor.constraint(equalToConstant: 170)
        ])
    }

    private func setupInformationViewWithHeaderConstraints(index: Int) {
        informationViewsWithHeader[index].translatesAutoresizingMaskIntoConstraints = false
        var constraints = [
            informationViewsWithHeader[index].leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            informationViewsWithHeader[index].trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            informationViewsWithHeader[index].heightAnchor.constraint(equalToConstant: 216)
        ]
        if index == 0 {
            constraints.append(informationViewsWithHeader[index].topAnchor.constraint(equalTo: informationView.bottomAnchor, constant: 16))
        } else {
            constraints.append(informationViewsWithHeader[index].topAnchor.constraint(equalTo: informationViewsWithHeader[index - 1].bottomAnchor, constant: 16))
        }
        NSLayoutConstraint.activate(constraints)
    }

    private func setupLookLaunchesButtonConstraints() {
        NSLayoutConstraint.activate([
            lookLaunchesButton.topAnchor.constraint(equalTo: informationView.bottomAnchor, constant: 216 + 216 + 16 + 16 + 25),
            lookLaunchesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            lookLaunchesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            lookLaunchesButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    // MARK: - Lifecycle

    override func layoutSubviews() {
        parametersCollectionView?.delegate = self
        parametersCollectionView?.dataSource = self
    }
}

extension RocketDetailsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParametersCollectionCell.identifier, for: indexPath) as! ParametersCollectionCell
        return cell
    }

}
