//
//  FilterView.swift
//  WeChatDemo
//
//  Created by jing 田 on 2022/2/20.
//

import SwiftUI

struct FilterView: View {
    @Binding var filters: [FilterModel]
    var body: some View {
        VStack() {
        Color(.init(srgbRed: 0, green: 1, blue: 0, alpha: 0.1))
            .overlay(alignment: .topTrailing) {
               VStack(alignment: .trailing) {
               List {
                    Text("filter")
                    ForEach($filters) { $filter in
                        HStack {
                            Button {
                                filter.isChose.toggle()
                            } label: {
                                Image(systemName: filter.isChose ? "checkmark.circle.fill" : "circle")
                            }
                            .buttonStyle(.plain)
                            Spacer()
                            Text(filter.name)
                        }
                        .frame(height: 40)
                    }
               }
               .frame(width: 200, height: CGFloat(filters.count + 2) * 40)
               .background(.yellow)
                Spacer()
            }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        var mockData = [FilterModel(name: "family", isChose: false), FilterModel(name: "friend", isChose: true)]
        FilterView(filters: .constant(mockData))
    }
}
