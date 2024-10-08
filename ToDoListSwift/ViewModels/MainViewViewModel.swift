//
//  MainViewViewModel.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//


/* Note About : This MainViewViewModel class plays a central role in managing the user’s
 authentication state in a SwiftUI application using Firebase. It monitors
 authentication state changes, updates observed properties (@Published),
 and provides useful information (isSignedIn) for SwiftUI views to react
 accordingly, thus improving the user experience. */


import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""
    
    private var handler: AuthStateDidChangeListenerHandle? // To Let a listener on logState
    
    init() {
        //Watching && UpDating
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
        
    }
    
    //To check if UserLogIn
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    
    
}//END class ...
