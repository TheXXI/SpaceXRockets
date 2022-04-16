//
//  ViewController.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 24.03.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var rockets: Rockets = []
    override func viewDidLoad() {
        super.viewDidLoad()

        print("viewDidLoad ended")
    }
}

/*AF.request("https://api.spacexdata.com/v4/rockets").responseDecodable(of: Rockets.self) { (response) in
    switch response.result {
    case .success(let getrockets):
        self.rockets = getrockets
    case .failure(let error):
        print(error)
    }
}*/
