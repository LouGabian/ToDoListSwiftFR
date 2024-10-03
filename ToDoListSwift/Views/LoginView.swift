//
//  LoginView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    
    var body: some View {
        
        NavigationView {
            
            VStack /* VStack#1 */ {
                
                //MARK: Header
                HeaderView(title: "Faï la liste", subtitle: "Passez à l'action!", angle: 15, background: Color.pink)
                
                //Login Form
                Form {
                    TextField("Adresse Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Mot de passe", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button {
                        //Attempt log in
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                            
                            Text("Connexion")
                                .foregroundColor(Color.white)
                                .bold()
                            
                        } // END ZSTACK LABEL
                        
                    }//END of Button
                    .padding()
                    
                }//END of Form
                
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
