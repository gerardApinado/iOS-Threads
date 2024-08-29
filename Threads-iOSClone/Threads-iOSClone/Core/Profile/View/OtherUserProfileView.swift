//
//  UserProfileView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/28/24.
//

import SwiftUI

struct OtherUserProfileView: View {
    
    @StateObject var viewModel : ProfileViewModel
    
    var user : User
        
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            ProfileHeaderView(user: user)
            
            HStack{
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352/2, height: 32)
                        .background(Color(.black))
                        .cornerRadius(8)
                }
                
                Button {
                    
                } label: {
                    Text("Mention")
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
            
            UserContentListView(user: user)
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 5) {
                    Button {
                        print("DEBUG: Other User Toolbar")
                    } label: {
                        Image(systemName: "bell")
                            .foregroundStyle(.black)
                    }
                    Button {
                        print("DEBUG: Other User Toolbar")
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

//#Preview {
//    OtherUserProfileView()
//}
