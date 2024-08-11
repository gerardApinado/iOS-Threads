//
//  ProfileViewModel.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/11/24.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
    @Published var selectedFilter: ProfileThreadFilter = .threads
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupSubsribers()
    }
    
    private func setupSubsribers() {
        UserService.shared.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }.store(in: &cancellable)
    }
    
}
