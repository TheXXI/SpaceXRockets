//
//  MainView.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 25.03.2022.
//

import UIKit

class MainView: UIView {

    // MARK: - Public properties

    let reloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перезагрузить", for: .normal)
        button.setTitleColor(.link, for: .normal)
        return button
    }()

    let activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.color = .white
        return activity
    }()

    // MARK: - Private properties

    private let errorTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Ошибка загрузки."
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)

        backgroundColor = .black

        addSubview(activity)
        addSubview(errorTextLabel)
        addSubview(reloadButton)
        errorTextLabel.isHidden = true
        reloadButton.isHidden = true

        setupConstraints()
        activity.startAnimating()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func showLoadErrorMessage() {
        errorTextLabel.isHidden = false
        reloadButton.isHidden = false
    }

    func hideLoadErrorMessage() {
        errorTextLabel.isHidden = true
        reloadButton.isHidden = true
    }

    // MARK: - Private methods

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            activity.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activity.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            errorTextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            errorTextLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -15),

            reloadButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            reloadButton.topAnchor.constraint(equalTo: errorTextLabel.bottomAnchor, constant: 5)
        ])
    }

    /*
    // MARK: - Public properties

    var width = UIScreen.main.bounds.size.width
    var height = UIScreen.main.bounds.size.height

    var rocketInformationViewArray: [RocketInformationView] = []

    let activity: UIActivityIndicatorView = {
        let activity =  UIActivityIndicatorView()
        activity.color = .white
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()

    let scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(
            width: UIScreen.main.bounds.size.width * 4,
            height: UIScreen.main.bounds.size.height - 72
        )
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.backgroundColor = UIColor.init(rgb: 0x121212)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

    // MARK: - Private properties

    private var rocketsCount = 1
    private let stackView = UIStackView()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)

        backgroundColor = .black

        addSubview(activity)
        activity.startAnimating()
        setupActivityConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func configure(conut: Int) {
        rocketsCount = conut
        //pageControl.numberOfPages = conut
        activity.stopAnimating()
        addSubview(pageControl)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        setupConstraints()

        createRocketDetailsViews()
    }

    // MARK: - Private methods

    private func createRocketDetailsViews() {
        for _ in 0..<rocketsCount {
            let informationView = RocketInformationView()
            informationView.translatesAutoresizingMaskIntoConstraints = false
            informationView.widthAnchor.constraint(equalToConstant: width).isActive = true
            stackView.addArrangedSubview(informationView)
            rocketInformationViewArray.append(informationView)
        }
    }

    // MARK: - Setup Constraints

    private func setupActivityConstraints() {
        NSLayoutConstraint.activate([
            activity.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activity.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            pageControl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 70),

            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: pageControl.topAnchor),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    */
}
