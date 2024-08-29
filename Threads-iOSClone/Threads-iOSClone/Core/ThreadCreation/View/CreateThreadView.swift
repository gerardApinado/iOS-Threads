//
//  CreateThreadView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import SwiftUI

struct CreateThreadView: View {
    
    @StateObject var viewModel = CreateThreadViewModel()
    @Environment(\.dismiss) var dismiss
    
    private var user : User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    CircleProfileImageView(user: user, size: .small)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        TextField("Start a thread...", text: $viewModel.caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !viewModel.caption.isEmpty {
                        Button {
                            viewModel.caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                
            }
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.black)
                            .font(.subheadline)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.uploadThread()
                            dismiss()
                        }
                    } label: {
                        Text("Post")
                            .foregroundColor(.black)
                            .opacity(viewModel.caption.isEmpty ? 0.5 : 1.0)
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    .disabled(viewModel.caption.isEmpty)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    CreateThreadView()
}
