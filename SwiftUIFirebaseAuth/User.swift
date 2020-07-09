//
//  User.swift
//  SwiftUIFirebaseAuth
//
//  Created by Lucas Spusta on 7/9/20.
//

import Foundation
class User {
    var uid: String
    var email: String?
    var displayName: String?

    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }

}
