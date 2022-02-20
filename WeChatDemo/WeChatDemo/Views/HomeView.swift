//
//  ContentView.swift
//  WeChatDemo
//
//  Created by jing 田 on 2022/2/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            NavigationView {
                ChatListView()
            }
            .tabItem {
                Label("chat", systemImage: "person")
            }
            
            
            NavigationView {
                CollectionView()
            }
            .tabItem {
                Label("colletion", systemImage: "book")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
