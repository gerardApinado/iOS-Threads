//
//  RegistrationView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject private var viewmodel = RegistrationViewModel()
    
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        VStack {
            Spacer()
            
            Image("threads-app-icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .padding()
                
            VStack {
                TextField("Enter your email", text: $viewmodel.emailTF)
                    .modifier(TextFieldModifier())
                    
                SecureField("Enter your password", text: $viewmodel.passwordTF)
                    .modifier(TextFieldModifier())
                
                TextField("Enter your full name", text: $viewmodel.fullnameTF)
                    .modifier(TextFieldModifier())
                
                TextField("Enter your username", text: $viewmodel.usernameTF)
                    .modifier(TextFieldModifier())
            }
            
            
            Button {
                Task { try await viewmodel.createUser() }
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
                dismiss()
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
