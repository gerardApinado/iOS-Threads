//
//  ProfileHeaderView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/28/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var user: User?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            /// name ang profile
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("@\(user?.username ?? "")")
                        .font(.subheadline)
                }
                
                Spacer()
                
                CircleProfileImageView(user: user, size: .medium)
            }
            
            if let bio = user?.bio {
                Text(bio)
                    .font(.subheadline)
            }
            
            Text("1.5m followers")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ProfileHeaderView()
}
