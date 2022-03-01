//
//  Chat.swift
//  WeChatDemo
//
//  Created by jing 田 on 2022/2/20.
//

import Foundation
struct Contact: Codable, Identifiable {
    var id: Int
    let name: String
    let imageName: String
    let chats: [Chat]
}

struct Chat: Codable, Identifiable, Hashable {
    let id = UUID()
    let time: Int
    let isSentByMe: Bool
    let text: String
}




