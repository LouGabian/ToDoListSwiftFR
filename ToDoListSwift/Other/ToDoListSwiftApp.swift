//
//  ToDoListSwiftApp.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 02/10/2024.
//



import FirebaseCore //Gestion du BackEnd avec firebase
import SwiftUI

@main
struct ToDoListSwiftApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
