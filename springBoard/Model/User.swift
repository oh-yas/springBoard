//
//  User.swift
//  springBoard
//
//  Created by Ojas Mehta on 1/10/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    
    let email: String
    let phonenumber: String
    let uid: String
    let username: String
}
