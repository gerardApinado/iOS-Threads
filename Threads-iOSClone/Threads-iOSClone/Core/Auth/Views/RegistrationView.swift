//
//  RegistrationView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var emailTF = "";
    @State private var passwordTF = "";
    @State private var fullnameTF = "";
    @State private var usernameTF = "";

    
    var body: some View {
        VStack {
            Spacer()
            
            Image("threads-app-icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .padding()
                
            VStack {
                TextField("Enter your email", text: $emailTF)
                    .modifier(TextFieldModifier())
                    
                SecureField("Enter your password", text: $passwordTF)
                    .modifier(TextFieldModifier())
                
                TextField("Enter your full name", text: $fullnameTF)
                    .modifier(TextFieldModifier())
                
                TextField("Enter your username", text: $usernameTF)
                    .modifier(TextFieldModifier())
            }
            
            
            Button {
                
            } label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 352, height: 44)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(8)
                    .padding()
            }
            
            Spacer()
            
            Divider()
            
            Button {
                
            } label: {
                HStack(spacing: 3){
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundColor(.black)
                
            }
            .padding(.vertical, 16)
            
        }
    }
}

#Preview {
    RegistrationView()
}
