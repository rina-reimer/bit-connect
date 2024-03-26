//
//  ConnectionsViewViewModel.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import Foundation

class ConnectionsViewViewModel: ObservableObject {
    @Published var searchModeOn: Bool = false
    @Published var showingFilterView: Bool = false
    
    init() {}
}

