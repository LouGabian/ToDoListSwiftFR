//
//  LoginView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    
    var body: some View {
        
        NavigationView {
            
            VStack /* VStack#1 */ {
                
                //MARK: Header
                HeaderView(title: "Faï la liste", subtitle: "Passez à l'action!", angle: 15, background: Color.pink)
                
                //Login Form

                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    
                    TextField("Adresse Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()

                    
                    SecureField("Mot de passe", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    //MARK: LogIn Button
                    TLButton (
                        title: "Connexion",
                        background: Color.blue
                    ) {
                        
                        viewModel.login()
                        
                    }//END of Button
                    .padding()
                    
                }//END of Form
                .offset(y: -50)
                
                //MARK: Create Account
                VStack{
                    Text("Pas encore inscrit ?")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    NavigationLink {
                        RegisterView()
                        
                    } label: {
                        
                        Text("Créer un compte")
                            .font(.caption)
                            .foregroundColor(.blue)
                        
                    }//END NavigationLink
                    
                }//End VStack AccountCreating
                .padding(.bottom, 100)
                
                Spacer()
                
            }// End de VStack#1
            
        }// END NavigationView
        
    }//End body: some View
    
}//END struct LoginView

#Preview {
    LoginView()
}
