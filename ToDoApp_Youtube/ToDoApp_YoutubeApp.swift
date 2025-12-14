//
//  ToDoApp_YoutubeApp.swift
//  ToDoApp_Youtube
//
//  Created by Phú Chiêm on 14/12/25.
//

import SwiftUI

@main
struct ToDoApp_YoutubeApp: App {
    
    @State var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environment(listViewModel)
        }
    }
}
