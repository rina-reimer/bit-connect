//
//  LoginView.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import SwiftUI

struct LoginView: View {
    @State var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Bit Connect", subtitle: "Find your people!", background: .green)
                    .offset(y: -70)
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                // Logo
                /*Image(.ponyo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                    .padding(.top, -50)*/
                // NetID login
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("School Email", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    BCButton(title: "Login",
                             background: .green
                    ){
                        viewModel.login()
                    }
                    
                }
                
                // Create Account
                VStack {
                    Text("New User?")
                    NavigationLink("Create an Account", destination: SSOLoginView())
                    .foregroundColor(.green)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
