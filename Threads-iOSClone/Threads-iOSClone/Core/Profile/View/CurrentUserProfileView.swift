//
//  CurrentUserProfileView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/28/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @StateObject var viewModel : ProfileViewModel
    
    private var currentUser: User? {
        return viewModel.user
    }
    
    @State var isShowEditProfile: Bool = false
        
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                
                ProfileHeaderView(user: currentUser)
                
                HStack {
                    Button {
                        isShowEditProfile = true
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352/2, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Share Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352/2, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    }
                }
                
                UserContentListView(viewModel: viewModel)
            }
            .sheet(isPresented: $isShowEditProfile,
            onDismiss: {
                isShowEditProfile = false
            }, content: {
                if let user = currentUser {
                    EditProfileView(user: user)
                }
            })
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

//#Preview {
//    CurrentUserProfileView()
//}
