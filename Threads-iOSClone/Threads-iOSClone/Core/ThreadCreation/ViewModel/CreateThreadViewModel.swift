//
//  CreateThreadViewModel.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/29/24.
//

import Firebase

class CreateThreadViewModel: ObservableObject {
    @Published var caption: String = ""
    
    func uploadThread() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        
        let thread = Thread(/*id:NSUUID().uuidString,*/ownerUID: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
