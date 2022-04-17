//
//  Launches.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 17.04.2022.
//

import Foundation

// MARK: - Launch
struct Launch: Codable {

    let rocket: String
    let success: Bool?
    let name: String
    let dateUnix: Int
    let id: String

    enum CodingKeys: String, CodingKey {

        case rocket, success
        case name
        case dateUnix = "date_unix"
        case id
    }
}

typealias Launches = [Launch]
