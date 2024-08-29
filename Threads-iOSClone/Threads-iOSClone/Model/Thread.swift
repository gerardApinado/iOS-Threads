//
//  Thread.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/29/24.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
//    let id: String
    
    @DocumentID var threadID: String?
    var id: String {
        return threadID ?? NSUUID().uuidString
    }
    
    let ownerUID: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var user: User?
}
