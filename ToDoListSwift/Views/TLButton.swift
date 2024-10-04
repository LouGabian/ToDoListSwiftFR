//
//  TLButton.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 04/10/2024.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                
            } // END ZSTACK LABEL
            
        }//END of Button
       
        
        
    }//END body: somme ...
    
}//END Struct View ...

#Preview {
    TLButton(title: "Boutton", background: Color.cyan) {
        //Action
    }
}
