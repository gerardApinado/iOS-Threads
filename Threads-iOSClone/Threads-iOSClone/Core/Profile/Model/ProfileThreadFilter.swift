//
//  ProfileThreadFilter.swift
//  Threads-iOSClone
//
//  Created by Gerard on 7/10/24.
//

import Foundation
import SwiftUI

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads:
            return "Threads"
        case .replies:
            return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
    
}
