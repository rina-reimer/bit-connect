//
//  User.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import Foundation

struct User: Codable {
    let id: String
    let netId: String
    let email: String
    let joined: TimeInterval
}
