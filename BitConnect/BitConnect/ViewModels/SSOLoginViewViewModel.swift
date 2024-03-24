//
//  SSOLoginViewViewModel.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class SSOLoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    var errorMessage = ""
    
    init() {}
    
    func register() {

        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email+"@uw.edu", password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
        
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           netId: email,
                           email: email+"@uw.edu",
                           joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage += "Please fill all fields.\n"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage += "Please enter a valid password (6+ letters)\n"
            return false
        }
        
        return true
    }
}
