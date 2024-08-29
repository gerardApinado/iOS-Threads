//
//  CreateThreadView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import SwiftUI

struct CreateThreadView: View {
    
    @State private var captionTF = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    CircleProfileImageView(user: DeveloperPreview.shared.user, size: .small)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("@loiverever")
                            .fontWeight(.semibold)
                        TextField("Start a thread...", text: $captionTF, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !captionTF.isEmpty {
                        Button {
                            captionTF = ""
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
                        
                    } label: {
                        Text("Post")
                            .foregroundColor(.black)
                            .opacity(captionTF.isEmpty ? 0.5 : 1.0)
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    .disabled(captionTF.isEmpty)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    CreateThreadView()
}
