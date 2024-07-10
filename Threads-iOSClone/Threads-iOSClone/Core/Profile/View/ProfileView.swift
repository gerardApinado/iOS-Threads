//
//  ProfileView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16 // 10 LR padding
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 12) {
                /// name ang profile
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Mary Loi Yves Ricalde")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("@loiverever♡")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    CircleProfileImageView()
                }
                
                Text("Bini Member; Main Vocal")
                    .font(.subheadline)
                
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
                                .fontWeight(selectedFilter == filter ? .semibold : .regular)
                            
                            if selectedFilter == filter {
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
                                selectedFilter = filter
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
    }
}

#Preview {
    ProfileView()
}
