//
//  SSOLoginViewViewModel.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class SSOLoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email+"@uw.edu", password: password) { result, error  in
            guard let userId = result?.user.uid else {
                return
            }
            
            self.insertUserRecord(id: userId)
        }
        
    }
    
    private func insertUserRecord(id: String) {
        let newUser = Student(id: id, netId: email)
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
