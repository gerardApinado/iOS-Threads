//
//  User.swift
//  Threads-iOSClone
//
//  Created by Gerard on 8/11/24.
//

import Foundation

struct User: Identifiable, Codable {
    var id : String
    var fullname : String
    var email : String
    var username : String
    var profileImageUrl : String?
    var bio : String?
}
