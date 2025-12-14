//
//  ListRowView.swift
//  ToDoApp_Youtube
//
//  Created by Phú Chiêm on 14/12/25.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ?"checkmark.circle":"circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

#Preview {
    
    var item1 = ItemModel(title: "First Item!", isCompleted: true)
    var item2 = ItemModel(title: "Second Item!", isCompleted: false)
    
    Group{
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
}
