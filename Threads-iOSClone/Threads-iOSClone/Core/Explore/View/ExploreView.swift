//
//  ExploreView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchTF = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { thread in
                        
                        UserCell()
                        
                        Divider()
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchTF, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
