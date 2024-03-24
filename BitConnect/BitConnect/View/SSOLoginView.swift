//
//  SSOLoginView.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import SwiftUI

struct SSOLoginView: View {
    @State var viewModel = SSOLoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // header
                Text("University of Washington")
                        .font(.system(size: 50))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .foregroundColor(.purple)
                        .padding()
                
                Text("Please sign in.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                // email
                    Text("UW NetID:")
                    TextField("", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                // password
                    Text("Password:")
                    SecureField("", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                
                // password
                
                // forgot password
                Link("Forgot your password?", destination: URL(string: "https://identity.uw.edu/account/resetpassword/")!)
                    .environment(\.openURL, OpenURLAction { url in
                        print("Open \(url)")
                        return .handled
                    })
                
                // sign in button
                BCButton(title: "Sign In", background: .gray
                ) {
                    viewModel.register()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    SSOLoginView()
}
