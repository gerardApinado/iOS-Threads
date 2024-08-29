//
//  UserService.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/11/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

final class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    private init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let uid = Auth.auth().currentUser?.uid else { return [] }
        do {
            let snapshot = try await Firestore.firestore().collection("users").getDocuments()
            let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
            return users.filter({ $0.id != uid }) // return all users except for current user == id
        } catch {
            print("DEBUG: \(error.localizedDescription)")
            return []
        }
    }
    
    static func fetchUser(withUID uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    func reset(){
        currentUser = nil
    }
    
    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl:String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(uid).updateData([
            "profileImageUrl": imageUrl
        ])
        self.currentUser?.profileImageUrl = imageUrl
    }
}
