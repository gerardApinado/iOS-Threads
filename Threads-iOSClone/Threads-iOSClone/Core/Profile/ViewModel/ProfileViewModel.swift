//
//  ProfileViewModel.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/11/24.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var selectedFilter: ProfileThreadFilter = .threads
    
    @Published var selectedItem : PhotosPickerItem? {
        didSet { Task { loadImage } }
    }
    @Published var profileImage : Image?
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupSubsribers()
    }
    
    private func setupSubsribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.user = user
        }.store(in: &cancellable)
    }
    
    private func loadImage() async {
        guard let item = selectedItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiimage = UIImage(data: data) else { return }
        
        self.profileImage = Image(uiImage: uiimage)
    }
    
}
