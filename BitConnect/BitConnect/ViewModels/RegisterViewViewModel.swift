//
//  RegisterViewViewModel.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import Foundation
import FirebaseAuth

class RegisterViewViewModel: ObservableObject {
    @Published var displayName = ""
    @Published var pronounNom = ""
    @Published var pronounAcc = ""
    @Published var pronounPoss = ""
    @Published var gradYear = ""
    @Published var intendedMajor = ""
    @Published var career = ""
    @Published var hobbies = ""
    
    var errorMessage = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !displayName.trimmingCharacters(in: .whitespaces).isEmpty,
              !pronounNom.trimmingCharacters(in: .whitespaces).isEmpty,
              !pronounAcc.trimmingCharacters(in: .whitespaces).isEmpty,
              !pronounPoss.trimmingCharacters(in: .whitespaces).isEmpty,
              !gradYear.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage += "Please fill fields for email, display name, pronouns, and graduation year.\n"
            return false
        }
        
        return true
    }
}
