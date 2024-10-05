//
//  NewItemView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel =  NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        
        
        VStack {
            Text("Nouvel élément")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                
                //MARK: Title
                TextField("Titre", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                
                //MARK:  Due Date
                DatePicker("Échéance", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //MARK:  Button
                TLButton(title: "Sauvegarder",
                         background: .pink
                ) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
                
                
            }//END form ...
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Erreure"),
                    message: Text("Veuillez remplir tous les champs et selectionner une date d'échéance à partir d'aujourd'hui.")
                )//END Alert
            }//END alert ...
            
            
        }//END VStack ...
        
    }//END Body ...
    
}//END struct View ...

#Preview {
    NewItemView( newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
