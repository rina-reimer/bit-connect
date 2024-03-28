//
//  Connection.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import Foundation
import SwiftUI

struct PublicConnection: Codable, Identifiable {
    let id: String?
    let user: String?
    var filter: [String: Set<Option>]?
    var matchesUser: Bool?
    var isDismissed: Bool?
    var isConnected: Bool?
    
    init(id: String, user: String, filter: [String: Set<Option>]) {
        self.id = id
        self.user = user
        self.filter = filter
        self.matchesUser = false
        self.isDismissed = false
        self.isConnected = false
    }
    
    mutating func setDismissed(_ state: Bool) {
        isDismissed = state
    }
    
    mutating func setConnected(_ state: Bool) {
        isConnected = state
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case user
        case filter
        case matchesUser
        case isDismissed
    }
}
