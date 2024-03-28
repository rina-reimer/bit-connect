//
//  PublicConnectionViewViewModel.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class PublicConnectionViewViewModel: ObservableObject {
    init() {}
    
    func toggleChat(connection: PublicConnection) {
        var newConnection = connection
        newConnection.setConnected(!connection.isConnected!)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("currConnections")
            .document(connection.id!)
            .setData(newConnection.asDictionary())
    }
}
