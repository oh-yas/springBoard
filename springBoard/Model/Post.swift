//
//  Post.swift
//  springBoard
//
//  Created by Ojas Mehta on 1/10/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    
    let caption: String
    let timestamp: Timestamp
    let uid: String
    let filepath: String
    
    var user: User?
}
