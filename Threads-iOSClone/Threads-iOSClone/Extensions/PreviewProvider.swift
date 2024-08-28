//
//  PreviewProvider.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/11/24.
//

import SwiftUI

// used for PreviewProvider only
extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Max Verstappen", email: "max@email.com", username: "maxverstappen")
}
