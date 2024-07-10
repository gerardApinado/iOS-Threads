//
//  CircleProfileView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import SwiftUI

struct CircleProfileImageView: View {
    
    var imageName = "placeholder-maloi"
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircleProfileImageView()
}
