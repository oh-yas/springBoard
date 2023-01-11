//
//  FeedView.swift
//  springBoard
//
//  Created by Ojas Mehta on 1/5/23.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach(viewModel.posts) { post in
                    posts(post: post)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
