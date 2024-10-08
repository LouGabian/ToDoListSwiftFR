//
//  RegisterView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    
    
    var body: some View {
        
        VStack {
            
            
            //MARK: Header
            HeaderView(title: "Inscription", subtitle: "Faites le premier pas!", angle: -15, background: .orange)
            
            Spacer()
            
            Form{
                
                TextField("Prénom et nom", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Adresse Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Mot de Passe", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Créer un compte", background: .green) {
                    viewModel.register()
                }
                .padding()
                
                
                
            }//END form
            .offset(y: -50)
            
            
        }//END VStack
        
        
        
        
    }// END body: some ...
}//END Struct View ...

#Preview {
    RegisterView()
}
