//
//  PasswordResetViewViewModel.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 07/10/2024.
//

// Note to self :
// It's possible to change the system of passwordReset
// in the app with a dynamicLinks with FirebaseDynamicLinks
// We have to configure an Url in the system App
// For this version, for this time I prefer to let Firebase
// manage the reset on its side since it has this possibility and
// I will configure and personalize this part on Firebase (landingpage of reset and email sent)




import FirebaseAuth
import Foundation

class PasswordResetViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var message: String = ""
    @Published var isError: Bool = false
    
    init() {}
    
    
    
    //MARK: resetPassword func
    func resetPassword() {
        
        guard validate() else { return }
        
        //Send a password reset email via Firebase
        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.message = error.localizedDescription
                    self?.isError = true
                } else {
                    self?.message = "Un email de réinitialisation a été envoyé dans votre boite mail!"
                    self?.isError = false
                    
                }//END if else ...
                
            }//END DispatchQueue
            
        }//END Auth.auth ...
        
    }//END func resetPassword
    
    //MARK: Validate func
    private func validate() -> Bool {
        
        message = "" //Resets the error message in case of correct validation
        
        
        //If no entry is made
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            message = "Veuillez entrer votre adresse email."
            isError = true
            return false
        }
        
        //Check that it is a valid email
        guard email.contains("@") && email.contains(".") else {
            message = "Veuillez entrer une adresse email valide."
            isError = true
            return false
        }
        return true
        
        
    }//END validate func
    
    
}//END Class ...



