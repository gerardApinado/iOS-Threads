//
//  FeedViewModel.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/29/24.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    init() {
        Task { try await fetchThreads() }
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThread()
    }
    
    private func fetchUserDataForThread() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUID = thread.ownerUID
            let threadUser = try await UserService.fetchUser(withUID: ownerUID)
            // inject user to a thread
            threads[i].user = threadUser
        }
    }
}
