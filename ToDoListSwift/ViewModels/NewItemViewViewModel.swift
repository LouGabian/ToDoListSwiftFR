//
//  NewItemViewViewModel.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//




import FirebaseAuth
import FirebaseFirestore
import Foundation


class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    
    init () {
        
    }
    
    
    //MARK: Save Func
    
    func save() {
        guard canSave else {
            return
        }
        
        
        //GET current user
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //CREATE model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        //SAVE model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionnary())
        
        
    }//END fun save
    
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        
        return true
        
    }//END canSave ...
    
}//END class ...
