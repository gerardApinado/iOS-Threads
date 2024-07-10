//
//  UserCell.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircleProfileImageView()
            
            VStack(alignment: .leading){
                Text("@loiverever♡")
                    .fontWeight(.semibold)
                Text("Bini Maloi")
            }
            .font(.footnote)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
