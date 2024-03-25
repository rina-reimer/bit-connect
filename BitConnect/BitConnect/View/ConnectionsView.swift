//
//  ConnectionsView.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import SwiftUI

struct ConnectionsView: View {
    @State var viewModel = ConnectionsViewViewModel()
    @State var userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Connections")
            .toolbar {
                Toggle(
                    "Vibrate on Ring",
                    systemImage: "dot.radiowaves.left.and.right",
                    isOn: $viewModel.searchModeOn
                )
            }
            .toggleStyle(.switch)
        }
        
    }
       
}

#Preview {
    ConnectionsView(userId: "")
}
