//
//  ProfileView.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import SwiftUI

struct ProfileView: View {
    @State var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    // Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.green)
                        .frame(width: 125, height: 125)
                    // Info: Name, Email, Member Since
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name: ")
                                .bold()
                            Text(user.netId)
                        }
                        HStack {
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        HStack {
                            Text("Member Since: ")
                                .bold()
                                Text(user.id)
                        }
                    }
                    .padding()
                    // Sign Out
                    Button("Sign Out") {
                        viewModel.logout()
                    }
                    .tint(.green)
                    .padding()
                    
                    Spacer()
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        //.onAppear{ viewModel.fetchUser() }
    }
}

#Preview {
    ProfileView()
}
