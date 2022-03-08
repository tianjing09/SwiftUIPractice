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
    let category: String
    let chats: [Chat]
    var isShield: Bool = false
}

struct Chat: Codable, Identifiable, Hashable {
    let id = UUID()
    var time: Int
    var displayTime: String
    let isSentByMe: Bool
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case time
        case isSentByMe
        case text
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        time = try container.decode(Int.self, forKey: .time)
        let date = Date.init(timeIntervalSince1970: TimeInterval(time))
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd HH:mm"
        displayTime = formatter.string(from: date)
        isSentByMe = try container.decode(Bool.self, forKey: .isSentByMe)
        text = try container.decode(String.self, forKey: .text)
    }
}




