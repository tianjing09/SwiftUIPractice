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
    
    func getContacts() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) { [weak self] in
            DispatchQueue.main.async {
                self?.contacts = load("chatsData.json")
            }
        }
    }
   
}
