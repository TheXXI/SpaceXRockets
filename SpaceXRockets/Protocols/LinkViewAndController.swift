//
//  LinkViewAndController.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 25.03.2022.
//

import UIKit

protocol LinkViewAndController {
    associatedtype RootView: UIView
}

extension LinkViewAndController where Self: UIViewController {
    func view() -> RootView {
        return self.view as! RootView
    }
}
