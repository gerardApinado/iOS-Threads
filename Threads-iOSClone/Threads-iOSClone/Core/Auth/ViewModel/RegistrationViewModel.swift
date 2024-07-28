//
//  RegistrationViewModel.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/28/24.
//

import Foundation
import SwiftUI

class RegistrationViewModel: ObservableObject {
    
    @Published var emailTF = "";
    @Published var passwordTF = "";
    @Published var fullnameTF = "";
    @Published var usernameTF = "";
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: emailTF, password: passwordTF, fullname: fullnameTF, username: usernameTF)
    }
}
