//
//  AuthService.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/28/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

final class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    private init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email:String, password:String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: Logged in User: \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to sign-in user with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email:String, password:String, fullname:String, username:String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
            print("DEBUG: Created User: \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() // remove session in BE
        self.userSession = nil      // remove session local
    }
    
    @MainActor
    private func uploadUserData(withEmail email:String, fullname:String, username:String, id:String) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
    }
    
    @MainActor
    private func downloadUserData() {
        
    }
    
}
