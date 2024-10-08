//
//  ContentView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 02/10/2024.
//

import SwiftUI

struct MainView: View {
    
    //To check if the user is logged in:
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            
            accountView
            
        } else {
            
            LoginView()
            
        } //END if else ...

        
    }// End body: some View
    
    @ViewBuilder
    var accountView: some View {
        
        TabView {
            
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Acceuil", systemImage: "house.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.crop.circle.fill")
                }
            
        }//End TableView ...
        
    }//END var accountView ...
    
}//End struct MainView ...



#Preview {
    MainView()
}
