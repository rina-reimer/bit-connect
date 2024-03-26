//
//  User.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct User: Codable {
    let id: String
    let netId: String
    let email: String
    let location: Coordinate
    let joined: TimeInterval
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
    func locationCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude,
                                      longitude: self.longitude)
    }
}
