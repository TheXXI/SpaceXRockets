//
//  MainView.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 25.03.2022.
//

import UIKit

class MainView: UIView {

    // MARK: - Public properties

    var rocketsCount = 4

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
        pageControl.backgroundColor = .black
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

    var width = UIScreen.main.bounds.size.width
    var height = UIScreen.main.bounds.size.height

    // MARK: - Private properties

    private let stackView = UIStackView()
    private var rocketDetailsViews: [RocketDetailsView] = []

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)

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
            let detailsView = RocketDetailsView()
            detailsView.translatesAutoresizingMaskIntoConstraints = false
            detailsView.widthAnchor.constraint(equalToConstant: width).isActive = true
            stackView.addArrangedSubview(detailsView)
            rocketDetailsViews.append(detailsView)
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
}
