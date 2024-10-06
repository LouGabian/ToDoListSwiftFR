//
//  ProfileViewViewModel.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//


import FirebaseAuth
import FirebaseFirestore
import Foundation


class ProfileViewViewModel: ObservableObject {
    
    
    init () {
        
    }// END init ...
    
    func toggleIsDone(item: ToDoListItem) {
        
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionnary())
        
    }//END func toggle ...
    
    
}// END class ...
