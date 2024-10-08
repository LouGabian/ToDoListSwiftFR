//
//  ProfileView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 02/10/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView {
            
            
            VStack /* #1 */{
                
                if let user = viewModel.user {
                    
                    profile(user: user)
                    
                } else {
                    
                    Text("Veuillez vous connecter\npour accéder à votre profil,\ns'il vous plait.")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    NavigationLink {
                        LoginView()
                        
                    } label: {
                        
                        Text("Conexion")
                            .font(.body)
                            .foregroundColor(.green)
                    }
                    
                }//END if let user ...
                
                
                
            }//END Vstack #1 ...
            .navigationTitle("Mon Profil")
            
            
        }//END NavigationView ...
        .onAppear() {
            viewModel.fetchUser()
        }
        
    }// END body: some ...
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //MARK: Avatar
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .clipShape(Circle())
        //                    .shadow(radius: 10)
            .padding()
        
        //MARK: Info: Name, Email, Menber since
        VStack /* info */(alignment: .leading) {
            
            HStack {
                Text("Nom complet: ")
                    .bold()
                
                Text(user.name)
            }
            .padding(5)
            
            HStack {
                Text("Email: ")
                    .bold()
                
                Text(user.email)
            }
            .padding(5)
            
            HStack {
                Text("Membre depuis: ")
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(5)
            
            
        }//END  Vstack info
        .padding()
        
        //MARK: Sign out
        Button("Déconnexion") {
            viewModel.logOut()
        }//END button
        .tint(.darkRed)
        .padding()
        
        Spacer()
        
        
        
    }//END profil: some ...
    
}//END struc View ...

#Preview {
    ProfileView()
}
