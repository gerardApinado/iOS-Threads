//
//  ProfileView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import SwiftUI

enum ProfileViewType {
    case currentUser
    case otherUser
}

struct ProfileView: View {
        
    var viewType: ProfileViewType = .currentUser
    
    @StateObject var viewModel = ProfileViewModel()
    
    var user: User?
    
    @Namespace private var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16 // 10 LR padding
    }
    
    var body: some View {
        if viewType == .currentUser {
            CurrentUserProfileView(viewModel: viewModel)
        } else {
            if let user = user {
                OtherUserProfileView(viewModel: viewModel, user: user)
            }
        }
    }
}

#Preview {
    ProfileView()
}
