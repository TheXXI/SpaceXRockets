//
//  MainViewController.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 25.03.2022.
//

import UIKit
import Alamofire

class MainViewController: UIViewController, LinkViewAndController {
    typealias RootView = MainView

    // MARK: - Private properties
    private var rockets = Rockets()
    private var launches = Launches()

    private var pageController: UIPageViewController!
    private var rocketControllers = [RocketViewController]()
    private var currentIndex: Int = 0

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadRockets()
    }

    override func loadView() {
        self.view = MainView()
    }

    // MARK: - Private methods

    private func loadRockets() {
        rockets.removeAll()
        rocketControllers.removeAll()
        AF.request("https://api.spacexdata.com/v4/rockets").responseDecodable(of: Rockets.self) { (response) in
            switch response.result {
            case .success(let rockets):
                self.rockets = rockets
                self.view().activity.stopAnimating()
                self.loadLaunches()
            case .failure(let error):
                print("rockets error message: \(error)")
                self.view().activity.stopAnimating()
                self.view().showLoadErrorMessage()
            }
        }

    }

    private func loadLaunches() {
        AF.request("https://api.spacexdata.com/v4/launches").responseDecodable(of: Launches.self) { (response) in
            switch response.result {
            case .success(let launches):
                self.launches = launches
                self.setupPageController()
            case .failure(let error):
                print("launches error message: \(error)")
            }
        }
    }

    private func reloadPageController () {
        for rocket in rockets {
            var currentRocketLaunches = Launches()

            for launch in launches {
                if rocket.id == launch.rocket {
                    currentRocketLaunches.append(launch)
                }
            }
            let controller = RocketViewController()
            controller.rocket = rocket
            controller.launches = currentRocketLaunches
            rocketControllers.append(controller)
        }
        self.pageController?.setViewControllers([rocketControllers[0]], direction: .forward, animated: false, completion: nil)
    }

    private func setupPageController() {
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

        self.pageController?.dataSource = self
        self.pageController?.delegate = self

        self.pageController?.view.backgroundColor = .clear
        self.pageController?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.addChild(self.pageController!)
        self.view.addSubview(self.pageController!.view)

        reloadPageController()

        self.pageController?.didMove(toParent: self)

        let pageControl: UIPageControl = UIPageControl.appearance(whenContainedInInstancesOf: [MainViewController.self])
        pageControl.backgroundColor = UIColor.init(rgb: 0x121212)
        pageControl.pageIndicatorTintColor = UIColor.init(rgb: 0x8E8E8E)
        pageControl.currentPageIndicatorTintColor = UIColor.white
    }

}

// MARK: - Extensions
extension MainViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = rocketControllers.firstIndex(of: viewController as! RocketViewController) {
                if index > 0 {
                    return rocketControllers[index - 1]
                } else {
                    return nil
                }
            }

            return nil

        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            if let index = rocketControllers.firstIndex(of: viewController as! RocketViewController) {
                if index < rocketControllers.count - 1 {
                    return rocketControllers[index + 1]
                } else {
                    return nil
                }
            }

            return nil
        }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
            return rocketControllers.count
    }

        func presentationIndex(for pageViewController: UIPageViewController) -> Int {
            return currentIndex
    }
}
