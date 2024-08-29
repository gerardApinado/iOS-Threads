//
//  CircleProfileView.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    case xxLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 48
        case .large:
            return 64
        case .xLarge:
            return 80
        case .xxLarge:
            return 88
        }
    }
}

struct CircleProfileImageView: View {
    var user : User?
    var size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            let url = URL(string: imageUrl)
            // Uncomment for native SwiftUI implementation
//            AsyncImage(url: url) { phase in
//                if let image = phase.image {
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: size.dimension, height: size.dimension)
//                        .clipShape(Circle())
//                } else {
//                    ProfileImagePlaceholder(size: size)
//                }
//            }
            
            // Add Kignfisher Package for KFImage
            // has built in caching image support unlike AsyncImage
            KFImage(url)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            ProfileImagePlaceholder(size: size)
        }
    }
}

//#Preview {
//    CircleProfileImageView(user: DeveloperPreview.shared.user)
//}

struct ProfileImagePlaceholder: View {
    let size : ProfileImageSize
    
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: size.dimension, height: size.dimension)
            .foregroundColor(Color(.systemGray4))
    }
}
