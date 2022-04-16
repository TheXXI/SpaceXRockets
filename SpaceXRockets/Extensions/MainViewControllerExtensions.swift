//
//  MainViewControllerExtensions.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 30.03.2022.
//

import Foundation
import UIKit

extension MainViewController {
    func configureView(rocketsCount: Int) {
        view().scrollView.delegate = self
        view().pageControl.addTarget(self, action: #selector(pageControlDidChanged), for: .valueChanged)
        view().configure(conut: rocketsCount)
    }

    @objc private func pageControlDidChanged (_ sender: UIPageControl) {
        view().scrollView.setContentOffset(CGPoint(x: CGFloat(sender.currentPage) * view().width, y: 0), animated: true)
        }

}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view().pageControl.currentPage = Int(
            floorf(
                Float(view().scrollView.contentOffset.x) / Float(view().scrollView.frame.width)
            )
        )
    }
}
