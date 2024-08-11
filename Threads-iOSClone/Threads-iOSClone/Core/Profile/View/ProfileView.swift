//
//  ProfileView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16 // 10 LR padding
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 12) {
                    /// name ang profile
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(currentUser?.fullname ?? "")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("@\(currentUser?.username ?? "")")
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        CircleProfileImageView()
                    }
                    
                    if let bio = currentUser?.bio {
                        Text(bio)
                            .font(.subheadline)
                    }
                    
                    Text("1.5m followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
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
                }
                
                VStack {
                    HStack {
                        ForEach(ProfileThreadFilter.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(viewModel.selectedFilter == filter ? .semibold : .regular)
                                
                                if viewModel.selectedFilter == filter {
                                    Rectangle()
                                        .foregroundStyle(.black)
                                        .frame(width: filterBarWidth, height: 1)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                } else {
                                    Rectangle()
                                        .foregroundStyle(.clear)
                                        .frame(width: filterBarWidth, height: 1)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring()){
                                    viewModel.selectedFilter = filter
                                }
                            }
                        }
                    }
                    
                    LazyVStack {
                        ForEach(0 ... 10, id: \.self){ thread in
                            ThreadCell()
                        }
                    }
                }
                .padding(.vertical, 8)
            }
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

#Preview {
    ProfileView()
}
