//
//  ExploreView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            UserCell(user: user)
                            Divider()
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Search")
            .navigationDestination(for: User.self, destination: { user in
//                ProfileView()
            })
            .searchable(text: $viewModel.searchTF, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
