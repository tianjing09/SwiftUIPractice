//
//  ChatListVM.swift
//  WeChatDemo
//
//  Created by jing 田 on 2022/2/20.
//

import Foundation
import SwiftUI
class ChatListVM: ObservableObject {
    @Published var contacts: [Contact] = []
    
    static var example = Contact(id: 1, name: "kim", imageName: "tortoise", chats: [Chat(time: 123, isSentByMe: false, text: "persistence is the key,Make a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger.")])
    
    func getContacts() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) { [weak self] in
            DispatchQueue.main.async {
                self?.contacts = load("chatsData.json")
            }
        }
    }
    
    
   
}
