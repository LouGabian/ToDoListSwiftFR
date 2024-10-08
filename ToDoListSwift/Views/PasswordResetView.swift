//
//  PasswordResetView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 07/10/2024.
//


import FirebaseAuth
import SwiftUI




struct PasswordResetView: View {
    @StateObject var viewModel = PasswordResetViewViewModel()
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                //MARK: Header
                ZStack /*#1*/ {
                    
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(Color.orange)
                        .rotationEffect(.degrees(-15))
                    
                    VStack /* VStack text */ {
                        
                        Text("Récupérez votre compte\nen réinitiallisant votre\nmot de passe")
                            .font(.system(size: 30))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.white)
                            .bold()
                        
                    }//END Vstack text
                    .padding(.top, 80)
                    
                }//END ZStack #1
                .frame(width: UIScreen.main.bounds.width * 3, height: 350)
                .offset(y: -150)
                
                Form {
                    //Display error message or confirm
                    if !viewModel.message.isEmpty {
                        Text(viewModel.message)
                            .foregroundColor(viewModel.isError ? .red : .green)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                    
                    TextField("Adresse Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .padding(.bottom, 10)
                    
                }
                
                //MARK: Reset Password Button
                
                TLButton(title: "Réinitialiser le mot de passe", background: .blue) {
                    viewModel.resetPassword()
                }
                .padding()
                .frame(width: 300, height: 100)
                .offset(y: -120)
                
                
                
                
                HStack {
                    
                    Text("Retourner à la page de")
                    NavigationLink(destination: LoginView()) {
                        Text("connexion")
                            .foregroundColor(Color.blue)
                    }
                }
                
                
                
                
            }//END Vstack  ...
            
            
        }//END NavigationView ...
        
        .navigationBarBackButtonHidden(true)
        
    }//END body: some ...
    
}//END struct View ...

#Preview {
    PasswordResetView()
}
