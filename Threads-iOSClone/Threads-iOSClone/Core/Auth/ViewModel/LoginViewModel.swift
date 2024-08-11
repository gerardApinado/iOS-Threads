//
//  LoginViewModel.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/11/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var emailTF = "";
    @Published var passwordTF = "";
    
    func signInUser() async throws {
        try await AuthService.shared.login(withEmail: emailTF, password: passwordTF)
    }
}
