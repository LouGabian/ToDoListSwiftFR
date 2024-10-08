//
//  LoginViewViewModel.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//



import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    func login() {
        
        guard validate() else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) //LogIn
        
    }//END func login ...
    

    //MARK: Validate func
    
    private func validate() -> Bool {
        
        errorMessage = "" //to let to hide errorMessage if it's valid
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Remplissez tous les champs s'il vous plaît"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Veuillez entrer un email valide"
            return false
        }
        
        return true
    }//END private func validate ...
    
    
    
}//END class LoginViewModel ...


