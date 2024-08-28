//
//  ProfileViewModel.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/11/24.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var selectedFilter: ProfileThreadFilter = .threads
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupSubsribers()
    }
    
    private func setupSubsribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.user = user
        }.store(in: &cancellable)
    }
    
    func setUser(_ user: User) {
        self.user = user
    }
    
}
