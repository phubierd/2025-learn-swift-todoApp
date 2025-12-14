//
//  ListView.swift
//  ToDoApp_Youtube
//
//  Created by Phú Chiêm on 14/12/25.
//

import SwiftUI

struct ListView: View {
    
    @Environment(ListViewModel.self) var listViewModel
    
    var body: some View {
        List{
            ForEach(listViewModel.items){item in
                ListRowView(item:item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add",destination: AddView()) )
    }
    
    
}

#Preview {
    NavigationStack{
        ListView()
    }
    .environment(ListViewModel())
}

