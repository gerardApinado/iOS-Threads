//
//  UserContentListView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/28/24.
//

import SwiftUI

struct UserContentListView: View {
    
    @StateObject var viewModel : ProfileViewModel
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16 // 10 LR padding
    }
    
    @Namespace private var animation
    
    var body: some View {
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
}

//#Preview {
//    UserContentListView()
//}
