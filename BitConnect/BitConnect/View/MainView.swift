//
//  ContentView.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // signed in state
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ConnectionsView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Connections", systemImage: "figure.2")
                    //person.line.dotted.person
                }
            
            MessagesView()
                .tabItem {
                    Label("Messages", systemImage: "person.bubble")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
