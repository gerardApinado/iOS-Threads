//
//  UserProfileView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/28/24.
//

import SwiftUI

struct OtherUserProfileView: View {
    
    @StateObject var viewModel : ProfileViewModel
    
    var user : User?
        
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
                        .frame(width: 352, height: 32)
                        .background(Color(.black))
                        .cornerRadius(8)
                }
            }
            
            UserContentListView(viewModel: viewModel)
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
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

//#Preview {
//    OtherUserProfileView()
//}
