//
//  ChatListRow.swift
//  WeChatDemo
//
//  Created by jing 田 on 2022/3/1.
//

import SwiftUI

struct ChatListRow: View {
    let contact: Contact
    var body: some View {
        HStack {
            Image(systemName: contact.imageName)
                .imageScale(.large)
                .symbolRenderingMode(.monochrome)
            VStack(spacing: 5) {
                HStack {
                    Text(contact.name)
                        .fontWeight(.bold)
                        .font(.caption)
                        .foregroundColor(.red)
                    Spacer()
                    Text("\(contact.chats.last?.displayTime ?? "")")
                        .fontWeight(.bold)
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
               // .background(.blue)
            
                HStack {
                    Text(contact.chats.last?.text ?? "")
                        .fontWeight(.bold)
                        .font(.caption)
                        .foregroundColor(.red)
                        .lineLimit(1)
                    Spacer()
                    if contact.isShield {
                        Image(systemName: "mic.slash")
                        .imageScale(.large)
                        .symbolRenderingMode(.monochrome)
                    }
                }
                //.background(.green)
            }
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 2)
        //.background(.gray)
        
    }
}

struct ChatListRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatListRow(contact: ChatListVM.example)
    }
}
