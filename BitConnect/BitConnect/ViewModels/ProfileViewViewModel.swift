//
//  ProfileViewViewModel.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    @Published var user: Student? = nil
    
    init() {
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
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
}
