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
            PublicConnectionView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
