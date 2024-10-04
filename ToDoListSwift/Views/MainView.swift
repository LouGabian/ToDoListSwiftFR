//
//  ContentView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 02/10/2024.
//

import SwiftUI

struct MainView: View {
    //Pour savoir si l'utilisateur est connecté :
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUsserId.isEmpty{
            // signed in
            ToDoListView()
        } else {
         
            LoginView()
            
        }
            
            
            
    }// End body: some View
    
}//End struct MainView



#Preview {
    MainView()
}
