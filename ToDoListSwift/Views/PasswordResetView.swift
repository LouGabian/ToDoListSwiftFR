//
//  PasswordResetView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 07/10/2024.
//


import FirebaseAuth
import SwiftUI




struct PasswordResetView: View {
    @State private var email: String = ""
    @State private var message: String = ""
    @State private var showMessage: Bool = false
    
    
    var body: some View {
        VStack {
            Text("Mot de passe oublié ?")
            
            TextField("Entrer votre email", text: $email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
        }//END Vstack
        
    }//END body: some ...
}//END struct View ...

#Preview {
    PasswordResetView()
}
