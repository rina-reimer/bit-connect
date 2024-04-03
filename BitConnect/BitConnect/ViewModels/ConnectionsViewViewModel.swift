//
//  ConnectionsViewViewModel.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ConnectionsViewViewModel: ObservableObject {
    @Published var searchModeOn: Bool = false
    @Published var showingFilterView: Bool = false
    @Published var user: Student? = nil
    
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
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = Student(id: data["id"] as? String ?? "",
                                  netId: data["netId"] as? String ?? "")
            }
        }
    }
}

