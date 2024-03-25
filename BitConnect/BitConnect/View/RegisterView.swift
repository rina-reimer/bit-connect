//
//  RegisterView.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import SwiftUI

struct RegisterView: View {
    @State var displayName = ""
    @State var pronounNom = ""
    @State var pronounAcc = ""
    @State var pronounPoss = ""
    @State var gradYear = ""
    @State var intendedMajor = ""
    @State var career = ""
    @State var hobbies = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Register",
                           subtitle: "Get to know you!",
                           background: .mint)
                    .offset(y: -70)
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                // Form
                Form {
                    Text("Email")
                    Text("Official Name")
                    TextField("Display Name",
                              text: $displayName)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    HStack{
                        TextField("they",
                                  text: $pronounNom)
                            .textFieldStyle(DefaultTextFieldStyle())
                        TextField("them",
                                  text: $pronounAcc)
                            .textFieldStyle(DefaultTextFieldStyle())
                        TextField("theirs",
                                  text: $pronounPoss)
                            .textFieldStyle(DefaultTextFieldStyle())
                    }
                    TextField("Graduation Year",
                              text: $gradYear)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Text("Current Major")
                    TextField("Intended Major",
                              text: $intendedMajor)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Career Path",
                              text: $career)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Intersts/Hobbies",
                              text: $hobbies)
                        .textFieldStyle(DefaultTextFieldStyle())
                    BCButton(title: "Create Account",
                             background: .mint
                    ) {
                        //Register
                    }
                    .frame(height:70)
                }
                .offset(y: -30)
                
                
                // Create Account
                Spacer()
            }
        }
    }
}

#Preview {
    RegisterView()
}
