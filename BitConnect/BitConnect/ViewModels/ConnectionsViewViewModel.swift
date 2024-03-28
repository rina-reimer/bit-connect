//
//  ConnectionsViewViewModel.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import Foundation
import FirebaseFirestore

class ConnectionsViewViewModel: ObservableObject {
    @Published var searchModeOn: Bool = false
    @Published var showingFilterView: Bool = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("currConnections")
            .document(id)
            .delete()
    }
    
}

