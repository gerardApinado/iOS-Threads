//
//  UserContentViewModel.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/29/24.
//

import Foundation

@MainActor
class UserContentViewModel: ObservableObject {
    
    @Published var threads = [Thread]()
    
    let user : User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserThreads() }
    }
    
    @Published var selectedFilter: ProfileThreadFilter = .threads
    
    func fetchUserThreads() async throws {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        // inject user to threads
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        
        self.threads = threads
    }
}
