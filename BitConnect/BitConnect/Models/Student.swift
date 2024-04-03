//
//  User.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import Foundation
import SwiftUI
import CoreLocation
import FirebaseFirestore
import FirebaseAuth

struct Student: Codable {
    let id: String
    var displayName: String
    let netId: String
    let email: String
    var latitude: Double
    var longitude: Double
    let joined: TimeInterval
    var isActive: Bool
    var schools: [Option]
    var intendedSchools: [Option]
    var institution: String
    var careerPaths: [Option]
    var interests: [Option]
    var desc: String
    
    init(id: String, netId: String) {
        self.id = id
        self.netId = netId
        self.email = netId + "@uw.edu"

        self.displayName = ""
        self.latitude = 0.0
        self.longitude = 0.0
        self.joined = Date().timeIntervalSince1970
        self.isActive = false
        self.intendedSchools = []
        self.careerPaths = []
        self.interests = []
        self.desc = ""
        
        // take from UW database
        self.institution = "University of Washington"
        self.schools = []
    }
                  
    mutating func registerInfo(currSchools: [Option], intendedSchools: [Option], careerPaths: [Option], interests: [Option]) {
        self.schools.append(contentsOf: currSchools)
        self.intendedSchools.append(contentsOf: intendedSchools)
        self.careerPaths.append(contentsOf: careerPaths)
        self.interests.append(contentsOf: interests)
    }
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
    func locationCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude,
                                      longitude: self.longitude)
    }
}

struct Option: Identifiable, Hashable, Codable, Equatable {
    let name: String?
    let id: String
    
    init(name: String) {
        self.name = name
        self.id = UUID().uuidString
    }
    
    enum CodingKeys: CodingKey {
        case name
        case id
    }
}

struct Selection: Hashable, Identifiable {
    var name: String
    var selection: Set<Option>
    let id = UUID()
    
    func getSelect() -> Set<Option> {
        return selection
    }
}
