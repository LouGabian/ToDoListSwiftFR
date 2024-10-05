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
            
            
            VStack {
                
            }//END Vstack
            .navigationTitle("Mon Profil")
                    
            
        }//END NavigationView ...
    }// END body ...
}//END struc View ...

#Preview {
    ProfileView()
}
