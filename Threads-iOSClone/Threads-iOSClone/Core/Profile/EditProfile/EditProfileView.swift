//
//  EditProfileView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/16/24.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var bioTF = ""
    @State private var linkTF = ""
    @State private var isPrivateProfile = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack(alignment: .leading){
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text("Mary Loi Yves Ricalde")
                        }
                        
                        Spacer()
                        
                        CircleProfileImageView()
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your bio" ,text:$bioTF, axis: .vertical)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add link ..." ,text:$linkTF, axis: .vertical)
                    }
                    
                    Divider()
                    
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                    
                }
                .font(.footnote)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .stroke(Color(uiColor: .systemGray4), lineWidth: 1)
                        }
                )
                
                .padding()
                
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Done")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.black)
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
