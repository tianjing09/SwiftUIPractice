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
    @Published var filters: [FilterModel] = []
    static var example = Contact(id: 1, name: "kim", imageName: "tortoise", category: "family", chats: [])
    func getContacts() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) { [weak self] in
            DispatchQueue.main.async {
                self?.contacts = load("chatsData.json")
                self?.updateFilters()
            }
        }
    }
    
    func deleteContact(id: Int) {
        contacts.removeAll { $0.id == id }
    }
    
    func shieldContact(id: Int) {
        if let index = contacts.firstIndex(where: { $0.id == id }) {
            contacts[index].isShield.toggle()
        }
    }
    
    func updateFilters() {
        let array = contacts.map { contact in
            return contact.category
        }
        let filterArray = Array(Set(array))
        if filters.isEmpty {
            filters = filterArray.map { category -> FilterModel in
                return FilterModel(name: category, isChose: true)
            }
        }
        filters = filterArray.map { category -> FilterModel in
            if let index = filters.firstIndex(where: { $0.name == category}) {
                return FilterModel(name: category, isChose: filters[index].isChose)
            }
            return FilterModel(name: category, isChose: false)
        }
    }
}

struct FilterModel: Hashable, Identifiable {
    var id = UUID()
    let name: String
    var isChose: Bool
}
