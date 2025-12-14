//
//  AddView.swift
//  ToDoApp_Youtube
//
//  Created by Phú Chiêm on 14/12/25.
//

import SwiftUI

struct AddView: View {
    
    @Environment(ListViewModel.self) var listViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var textFieldText:String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
        
    }
    
    func textIsAppropriate()->Bool{
        if textFieldText.count < 3 {
            alertTitle = "Your new to-do item must be at least 3 characters long 😳"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack{
        AddView()
    }
    .environment(ListViewModel())
}
