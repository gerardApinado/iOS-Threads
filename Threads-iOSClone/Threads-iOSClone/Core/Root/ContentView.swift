//
//  ContentView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                AppTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
