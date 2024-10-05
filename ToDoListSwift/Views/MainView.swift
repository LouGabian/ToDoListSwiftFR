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
            
            accountView
            
        } else {
            
            LoginView()
            
        } // if else
        
        
        
    }// End body: some View
    
    @ViewBuilder
    var accountView: some View {
        
        TabView {
            
            ToDoListView(userId: viewModel.currentUsserId)
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
