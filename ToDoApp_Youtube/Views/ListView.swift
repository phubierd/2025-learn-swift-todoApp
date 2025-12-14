//
//  ListView.swift
//  ToDoApp_Youtube
//
//  Created by Phú Chiêm on 14/12/25.
//

import SwiftUI

struct ListView: View {
    
    @State var items:[String] = [
        "this is the first title!",
        "This is the second",
        "third!"
    ]
    
    var body: some View {
        List{
            ForEach(items,id:\.self){item in
                ListRowView(title: item)
            }
            
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
}

