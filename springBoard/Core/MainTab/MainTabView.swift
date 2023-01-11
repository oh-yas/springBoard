//
//  MainTabView.swift
//  springBoard
//
//  Created by Ojas Mehta on 1/8/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 1
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            NewPostView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Image(systemName : "plus")
                } .tag(0)
            
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Image(systemName : "house")
                } .tag(1)
            
            SocialView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem {
                    Image(systemName : "network")
                } .tag(2)
            
            
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
