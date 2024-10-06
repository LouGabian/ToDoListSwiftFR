//
//  ToDoListViewViewModel.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//

import FirebaseFirestore
import Foundation


// ViewModel for list of items view
// Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    
    private let userID: String
    
    init (userId: String) {
        self.userID = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id: String) {
       let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
        
        
    }
    
}
