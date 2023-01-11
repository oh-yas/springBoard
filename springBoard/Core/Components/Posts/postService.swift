//
//  postService.swift
//  springBoard
//
//  Created by Ojas Mehta on 1/9/23.
//

import Firebase

struct PostService {
    
    func fetchPosts(completion: @escaping([Post]) -> Void) {
        Firestore.firestore().collection("posts")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let posts = documents.compactMap({try? $0.data(as: Post.self)})
                completion(posts)
        }
    }
}
