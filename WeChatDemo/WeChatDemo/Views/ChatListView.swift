//
//  ChatList.swift
//  WeChatDemo
//
//  Created by jing 田 on 2022/2/20.
//

import SwiftUI

struct ChatListView: View {
    @StateObject private var vm = ChatListVM()
    var body: some View {
        List {
            Text("hello, jing")
            
            ForEach(vm.contacts) { contact in
                Text(contact.name)
            }
        }
        .navigationTitle("Chat")
        .onAppear {
            print("tian:onAppear")
            vm.getContacts()
        }
        .task {
            print("tian:task")
        }
        .onDisappear {
            print("tian:onDisappear")
        }
        .onHover { isHover in
            print("tian:onhover\(isHover)")
        }
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
