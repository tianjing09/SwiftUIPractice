//
//  ChatList.swift
//  WeChatDemo
//
//  Created by jing 田 on 2022/2/20.
//

import SwiftUI

struct ChatListView: View {
    @StateObject private var vm = ChatListVM()
    @State private var showFilter = false
    var body: some View {
        List {
            Text("hello, jing")
            
            ForEach(vm.contacts) { contact in
                if let index = vm.filters.firstIndex(where: { $0.name == contact.category }), vm.filters[index].isChose {
                ChatListRow(contact: contact)
                .swipeActions {
                    Button(role: .destructive) {
                        vm.deleteContact(id: contact.id)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    Button(role: .cancel) {
                        vm.shieldContact(id: contact.id)
                    } label: {
                        Label("Disturb", systemImage: "mic.slash")
                    }
                }
                }
            }
        }
        .navigationTitle("Chat")
        .toolbar {
            ToolbarItem {
                Button {
                    showFilter.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .overlay(alignment: .top) {
            if showFilter {
                FilterView(filters: $vm.filters)
//                    .onTapGesture {
//                        showFilter = false
//                    }
            }
        }
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
